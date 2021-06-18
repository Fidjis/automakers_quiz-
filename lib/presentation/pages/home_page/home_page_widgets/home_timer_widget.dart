import 'package:automakers_quiz/presentation/pages/home_page/home_page_controller.dart';
import 'package:automakers_quiz/presentation/util/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerWidget extends GetView<HomePageController> {
  Widget build(BuildContext context) {
    final questionIndex = Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Obx(
          () => Text(
            '${controller.currentQuestionIndex.value + 1}°',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
    final questionsQuant = Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Obx(
          () => Text(
            '${controller.questions.value.length}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
    final linearProgress = Expanded(
      child: Obx(
        () => LinearProgressIndicator(
          backgroundColor: AppStyle.segundaryColor,
          value: controller.timerProgress.value,
          valueColor: AlwaysStoppedAnimation<Color>(AppStyle.primaryColor),
        ),
      ),
    );
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AnimatedOpacity(
          opacity: controller.timerStart.value == 10 ? 0 : 1,
          duration: Duration(milliseconds: 300),
          child: Row(
            children: <Widget>[
              questionIndex,
              linearProgress,
              questionsQuant,
            ],
          ),
        ),
      ),
    );
  }
}
