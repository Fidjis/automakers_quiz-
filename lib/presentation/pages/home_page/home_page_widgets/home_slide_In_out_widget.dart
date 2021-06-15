import 'package:automakers_quiz/presentation/util/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_page_controller.dart';

class SlideInOutWidget extends GetView<HomePageController> {
  final Widget? child;
  SlideInOutWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TweenAnimationBuilder(
        tween: Tween<Offset>(begin: Offset(controller.startPos.value, 0), end: Offset(controller.endPos.value, 0)),
        duration: Duration(seconds: 1),
        curve: controller.curve.value,
        builder: (context, offset, child) {
          return FractionalTranslation(
            translation: offset as Offset,
            child: Center(
              child: Container(
                child: child,
                height: 350.0,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: AppStyle.terciaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: child,
        onEnd: () {},
      ),
    );
  }
}
