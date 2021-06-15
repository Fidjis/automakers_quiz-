import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final startPos = Rx<double>(-1.0);
  final endPos = Rx<double>(0.0);
  final curve = Rx<Curve>(Curves.elasticOut);
  final contentChild = Rx<Widget>(Container());

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
