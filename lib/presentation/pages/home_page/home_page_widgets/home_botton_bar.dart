import 'package:automakers_quiz/presentation/pages/home_page/home_page_controller.dart';
import 'package:automakers_quiz/presentation/pages/home_page/home_page_widgets/home_user_name_widget.dart';
import 'package:automakers_quiz/presentation/pages/modals/ranking_modal.dart';
import 'package:automakers_quiz/presentation/util/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_menu_button_widget.dart';
import 'home_timer_widget.dart';

class HomeBottomBar extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 75,
        decoration: BoxDecoration(
          color: AppStyle.terciaryColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 8,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: controller.isPlaying.value
            ? TimerWidget()
            : Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MenuButtonWidget(
                      text: 'RANKING',
                      iconData: Icons.star,
                      onPressed: () {
                        controller.isPlayOptionSelected.value = false;
                        controller.changeChildOfSlidWidgetSlidAnimation(RankingModal());
                      },
                      color: controller.isPlayOptionSelected.value ? AppStyle.segundaryColor : Colors.lightBlueAccent,
                    ),
                    MenuButtonWidget(
                      text: 'JOGAR',
                      iconData: Icons.play_arrow,
                      onPressed: () {
                        controller.isPlayOptionSelected.value = true;
                        controller.nickName.text = '';
                        controller.changeChildOfSlidWidgetSlidAnimation(UserNameWidget());
                      },
                      color: controller.isPlayOptionSelected.value ? Colors.lightBlueAccent : AppStyle.segundaryColor,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
