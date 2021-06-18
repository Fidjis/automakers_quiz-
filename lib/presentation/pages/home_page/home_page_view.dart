import 'package:automakers_quiz/presentation/widgets/app_bar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page_controller.dart';
import 'home_page_widgets/home_botton_bar.dart';
import 'home_page_widgets/home_slide_In_out_widget.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: HomeBottomBar(),
        key: controller.scaffoldKey,
        body: Stack(
          children: [
            MyAppBar(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Obx(
                  () => SlideInOutWidget(
                    child: controller.childOfSlidWidget.value,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
