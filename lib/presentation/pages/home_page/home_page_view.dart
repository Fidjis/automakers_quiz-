import 'package:automakers_quiz/presentation/util/app_style.dart';
import 'package:automakers_quiz/presentation/util/star_icon.dart';
import 'package:automakers_quiz/presentation/widgets/app_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page_controller.dart';
import 'home_page_widgets/home_botton_bar.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () => controller.changeContendChildWithSlidAnimation()),
        bottomSheet: HomeBottomBar(),
        key: controller.scaffoldKey,
        body: Stack(
          children: [
            buildAppBar(context),
            Center(
              child: SlideInOutWidget(
                child: controller.contentChild.value,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      height: 160.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppStyle.terciaryColor,
        boxShadow: [BoxShadow(blurRadius: 40.0)],
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width, 100.0)),
      ),
      child: Stack(
        children: <Widget>[
          AppTitle(),
          Positioned(
            top: 80.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: DecoratedBox(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(1.0), color: Colors.white),
                child: Row(
                  children: [
                    StarIcon(),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "“Prove o que você sabe”",
                          textScaleFactor: 0.9,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    StarIcon(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
                height: 300.0,
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
