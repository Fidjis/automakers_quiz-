import 'package:flutter/material.dart';

import '../util/app_style.dart';

class StarIcon extends StatelessWidget {
  final Color? color;

  factory StarIcon.primaryColor() {
    return StarIcon._(color: AppStyle.primaryColor);
  }

  factory StarIcon.white() {
    return StarIcon._(color: Colors.white);
  }

  const StarIcon._({
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: color,
    );
  }
}
