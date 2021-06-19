import 'package:automakers_quiz/presentation/util/app_style.dart';
import 'package:automakers_quiz/presentation/widgets/spacing.dart';
import 'package:automakers_quiz/presentation/widgets/star_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_page_controller.dart';

class QuestionsWidget extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    final question = Obx(
      () => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'De onde é a ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: controller.currentQuestion.value!.brand,
                  style: TextStyle(
                    color: AppStyle.primaryColor,
                  ),
                ),
                TextSpan(
                  text: ' ?',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    final options = Flexible(
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.currentQuestion.value!.options.length,
          itemBuilder: (BuildContext context, int position) {
            return Obx(
              () => InkWell(
                onTap: () => controller.selectedIndex.value = position,
                child: Container(
                  child: Card(
                    color: controller.selectedIndex.value == position ? AppStyle.primaryColor : AppStyle.segundaryColor,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    shape: controller.selectedIndex.value == position
                        ? StadiumBorder(side: BorderSide(color: AppStyle.primaryColor, width: 2.0))
                        : StadiumBorder(side: BorderSide(color: AppStyle.segundaryColor, width: 2.0)),
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(
                            controller.currentQuestion.value!.options[position],
                            style: TextStyle(
                                color: controller.selectedIndex.value == position
                                    ? AppStyle.segundaryColor
                                    : AppStyle.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
    final button = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: FloatingActionButton.extended(
        backgroundColor: AppStyle.segundaryColor,
        onPressed: () => controller.changeQuestionWithSlidAnimation(),
        label: Icon(
          Icons.play_arrow,
          color: AppStyle.primaryColor,
        ),
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Spacing.extraSmall(),
        StarIcon.white(),
        Spacing.extraSmall(),
        question,
        Spacing.extraSmall(),
        options,
        Spacing.extraSmall(),
        button,
      ],
    );
  }
}
