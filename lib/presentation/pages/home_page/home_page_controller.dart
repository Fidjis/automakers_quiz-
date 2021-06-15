import 'package:automakers_quiz/core/domain/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  //home
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //SlidInOutWidget
  final startPos = Rx<double>(-1.0);
  final endPos = Rx<double>(0.0);
  final curve = Rx<Curve>(Curves.elasticOut);

  //QuestionsWidget
  final selectedIndex = Rx(0);
  // final question = Rx(<Question>[]);
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
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeContendChildWithSlidAnimation() {
    curve.value = curve.value == Curves.elasticOut ? Curves.elasticIn : Curves.elasticOut;

    startPos.value = 0.0;
    endPos.value = 1.0;

    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        curve.value = curve.value == Curves.elasticOut ? Curves.elasticIn : Curves.elasticOut;
        startPos.value = 1.0;
        endPos.value = 0.0;
      },
    );
  }
}
