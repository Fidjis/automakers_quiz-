import 'dart:async';
import 'dart:convert';

import 'package:automakers_quiz/core/domain/models/question_model.dart';
import 'package:automakers_quiz/core/domain/models/ranking_model.dart';
import 'package:automakers_quiz/infrastructure/repositories/data_service.dart';
import 'package:automakers_quiz/infrastructure/repositories/database.dart';
import 'package:automakers_quiz/presentation/pages/home_page/home_page_widgets/home_user_name_widget.dart';
import 'package:automakers_quiz/presentation/pages/modals/ranking_modal.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:automakers_quiz/presentation/pages/modals/completed_questions_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  //home
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //UserNameWidget
  final nickName = TextEditingController();

  //SlidInOutWidget
  final startPos = Rx<double>(-1.0);
  final endPos = Rx<double>(0.0);
  final curve = Rx<Curve>(Curves.elasticOut);
  final childOfSlidWidget = Rxn<Widget>();

  //QuestionsWidget
  final selectedIndex = Rx(-1);
  final questions = Rx(<Question>[]);
  final currentQuestion = Rxn<Question>();
  final currentQuestionIndex = Rx(0);
  int hits = 0;

  //ranking
  final ranking = Rxn<List<Ranking>>();

  //timerWidget
  late Timer _timer;
  final timerStart = Rx(10);
  final timerProgress = Rx(1.0);

  @override
  void onInit() {
    super.onInit();
    childOfSlidWidget.value = UserNameWidget();
    getQuestions();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (timerStart.value == 0) {
        _timer.cancel();
        timerStart.value = 10;
        timerProgress.value = 1;
        changeQuestionWithSlidAnimation();
      } else {
        timerProgress.value -= 0.1;
        timerStart.value--;
      }
    });
  }

  void resetTimer() {
    _timer.cancel();
    timerStart.value = 10;
    timerProgress.value = 1.0;
  }

  void resetQuestions() {
    questions.value.shuffle();
    currentQuestionIndex.value = 0;
    currentQuestion.value = questions.value[currentQuestionIndex.value];
  }

  Future<void> addRanking() async {
    final hitsPercent = (hits * 100) / questions.value.length;

    if (hitsPercent > 0) {
      final ranking = Ranking(hit: hitsPercent.toInt(), name: nickName.text);
      await DBProvider.db.newRanking(ranking);
    }
    DBProvider.db.getTopFiveRankings().then((ranking) => this.ranking.value = ranking);
    hits = 0;
  }

  void changeQuestionWithSlidAnimation() {
    curve.value = curve.value == Curves.elasticOut ? Curves.elasticIn : Curves.elasticOut;
    startPos.value = 0.0;
    endPos.value = 1.0;
    resetTimer();

    if (selectedIndex.value != -1) {
      final answer = currentQuestion.value!.options[selectedIndex.value];
      final correct = currentQuestion.value!.correct;
      if (answer.toLowerCase() == correct.toLowerCase()) {
        hits++;
      }
    }

    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        //change next question
        selectedIndex.value = -1;
        if (currentQuestionIndex < (questions.value.length - 1)) {
          currentQuestionIndex.value++;
          currentQuestion.value = questions.value[currentQuestionIndex.value];
          currentQuestion.value!.options.shuffle();
          startTimer();
        } else if (currentQuestionIndex == (questions.value.length - 1)) {
          currentQuestionIndex.value = 0;
          resetTimer();
          addRanking();
          _showResultModal();
          changeChildOfSlidWidgetSlidAnimation(RankingModal());
        }

        curve.value = curve.value == Curves.elasticOut ? Curves.elasticIn : Curves.elasticOut;
        startPos.value = 1.0;
        endPos.value = 0.0;
      },
    );
  }

  _showResultModal() {
    showGeneralDialog(
      context: scaffoldKey.currentContext!,
      pageBuilder: (context, anim1, anim2) {
        return Container();
      },
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierLabel: '',
      transitionBuilder: (context, anim1, anim2, child) {
        return Transform.rotate(
          angle: math.radians(anim1.value * 360),
          child: Opacity(
            opacity: anim1.value,
            child: CompletedQuestionsModal(),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 300),
    );
  }

  _showSnackMessage(String message) {
    Get.showSnackbar(GetBar(
      title: 'Mensagem:',
      message: message,
      duration: Duration(milliseconds: 3000),
      snackPosition: SnackPosition.BOTTOM,
    ));
  }

  changeChildOfSlidWidgetSlidAnimation(Widget newChild) {
    curve.value = curve.value == Curves.elasticOut ? Curves.elasticIn : Curves.elasticOut;
    startPos.value = 0.0;
    endPos.value = 1.0;

    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        childOfSlidWidget.value = newChild;

        curve.value = curve.value == Curves.elasticOut ? Curves.elasticIn : Curves.elasticOut;
        startPos.value = 1.0;
        endPos.value = 0.0;
      },
    );
  }

  void getQuestions() {
    DataServices.makeGetRequest(url: DataServices.end_point_auto_quiz_v1).then((result) {
      if (result.statusCode == 200) {
        try {
          final List<dynamic> json = jsonDecode(Utf8Decoder().convert(result.bodyBytes));
          questions.value = json.map((element) => Question.fromJson(element)).toList();
          questions.value.shuffle();
          currentQuestion.value = questions.value[currentQuestionIndex.value];
        } catch (e) {
          _showSnackMessage('Erro ao obter as questões!');
        }
      } else {
        _showSnackMessage('Erro ao obter as questões!');
      }
    });
  }
}
