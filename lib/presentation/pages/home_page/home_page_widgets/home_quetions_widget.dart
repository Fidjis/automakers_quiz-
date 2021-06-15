import 'package:automakers_quiz/presentation/util/app_style.dart';
import 'package:automakers_quiz/presentation/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_page_controller.dart';

class QuestionsWidget extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Spacing.extraSmall(),
        Icon(
          Icons.person,
          color: Colors.lightBlue,
        ),
        Spacing.extraSmall(),
        Flexible(
          child: ListView.builder(
            itemCount: controller.questions.value.length,
            itemBuilder: (BuildContext context, int position) {
              return Obx(
                () => InkWell(
                  onTap: () => controller.selectedIndex.value = position,
                  child: Container(
                    // width: 150,
                    child: Card(
                      shape: (controller.selectedIndex.value == position)
                          ? RoundedRectangleBorder(side: BorderSide(color: Colors.green))
                          : null,
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(controller.questions.value[position].brand),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Spacing.extraSmall(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: FloatingActionButton.extended(
            backgroundColor: AppStyle.segundaryColor,
            onPressed: () => controller.changeContendChildWithSlidAnimation(),
            label: Icon(
              Icons.play_arrow,
              color: AppStyle.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
