import 'package:automakers_quiz/presentation/pages/home_page/home_page_controller.dart';
import 'package:automakers_quiz/presentation/pages/home_page/home_page_widgets/home_user_name_widget.dart';
import 'package:automakers_quiz/presentation/util/app_style.dart';
import 'package:automakers_quiz/presentation/widgets/spacing.dart';
import 'package:automakers_quiz/presentation/widgets/star_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RankingModal extends GetView<HomePageController> {
  Widget build(BuildContext context) {
    final title = Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          'TOP 5',
          style: TextStyle(color: AppStyle.primaryColor),
        ),
      ),
    );
    final ranking = Obx(
      () => ListView.builder(
        shrinkWrap: true,
        itemCount: controller.ranking.value!.length,
        itemBuilder: (BuildContext context, int position) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppStyle.segundaryColor,
                  child: Center(
                    child: Text(
                      '${position + 1}º',
                      style: TextStyle(color: AppStyle.primaryColor, fontSize: 13),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Card(
                      color: AppStyle.segundaryColor,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: StadiumBorder(side: BorderSide(color: AppStyle.segundaryColor, width: 2.0)),
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Text(
                              controller.ranking.value![position].name,
                              style: TextStyle(color: AppStyle.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: AppStyle.segundaryColor,
                  child: Center(
                    child: Text(
                      '${controller.ranking.value![position].hit}%',
                      style: TextStyle(color: AppStyle.primaryColor, fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    final button = Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: FloatingActionButton.extended(
        backgroundColor: AppStyle.segundaryColor,
        onPressed: () {
          controller.nickName.text = '';
          controller.isPlayOptionSelected.value = true;
          controller.changeChildOfSlidWidgetSlidAnimation(UserNameWidget());
        },
        label: Icon(
          Icons.play_arrow,
          color: AppStyle.primaryColor,
        ),
      ),
    );
    final stars = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StarIcon.white(),
        StarIcon.white(),
        StarIcon.white(),
      ],
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Spacing.extraSmall(),
        stars,
        Spacing.extraSmall(),
        title,
        Spacing.extraSmall(),
        Expanded(
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: controller.ranking.value == null || controller.ranking.value!.isEmpty
                  ? Center(
                      child: Text(
                        'Sem registros!',
                        style: TextStyle(color: AppStyle.segundaryColor),
                      ),
                    )
                  : ranking,
            ),
          ),
        ),
        button,
      ],
    );
  }
}
