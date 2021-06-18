import 'package:automakers_quiz/core/domain/models/question_model.dart';
import 'package:automakers_quiz/presentation/pages/home_page/home_page_widgets/home_user_name_widget.dart';
import 'package:automakers_quiz/presentation/pages/modals/ranking_modal.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:automakers_quiz/presentation/pages/modals/completed_questions_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page_widgets/home_quetions_widget.dart';

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
  // final question = Rx(<Question>[]);
  final currentQuestion = Rxn<Question>();
  int _currentQuestionIndex = 0;
  final questions = Rx(<Question>[
    Question.fromJson({
      "brand": "BMW",
      "options": ["Inglaterra", "USA", "Alemanha", "JapÃ£o"],
      "correct": "alemanha"
    }),
    Question.fromJson({
      "brand": "Toyota",
      "options": ["Inglaterra", "USA", "Alemanha", "JapÃ£o"],
      "correct": "japao"
    }),
    Question.fromJson({
      "brand": "Mini  Cooper",
      "options": ["Inglaterra", "USA", "Alemanha", "JapÃ£o"],
      "correct": "inglaterra"
    }),
    Question.fromJson({
      "brand": "General  Motors",
      "options": ["Inglaterra", "USA", "Alemanha", "JapÃ£o"],
      "correct": "usa"
    }),
    Question.fromJson({
      "brand": "Rolls Royce",
      "options": ["Inglaterra", "USA", "Alemanha", "JapÃ£o"],
      "correct": "inglaterra"
    }),
  ]);

  @override
  void onInit() {
    super.onInit();
    questions.value.shuffle();
    currentQuestion.value = questions.value[_currentQuestionIndex];
    childOfSlidWidget.value = UserNameWidget();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void resetQuestions() {
    questions.value.shuffle();
    _currentQuestionIndex = 0;
    currentQuestion.value = questions.value[_currentQuestionIndex];
  }

  void changeQuestionWithSlidAnimation() {
    curve.value = curve.value == Curves.elasticOut ? Curves.elasticIn : Curves.elasticOut;

    startPos.value = 0.0;
    endPos.value = 1.0;

    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        //change next question
        selectedIndex.value = -1;
        if (_currentQuestionIndex < (questions.value.length - 1)) {
          _currentQuestionIndex++;
          currentQuestion.value = questions.value[_currentQuestionIndex];
          currentQuestion.value!.options.shuffle();
        } else if (_currentQuestionIndex == (questions.value.length - 1)) {
          _currentQuestionIndex = 0;
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
      duration: Duration(milliseconds: 1500),
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
        //change next question
        childOfSlidWidget.value = newChild;

        curve.value = curve.value == Curves.elasticOut ? Curves.elasticIn : Curves.elasticOut;
        startPos.value = 1.0;
        endPos.value = 0.0;
      },
    );
  }
}
