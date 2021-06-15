import 'package:flutter/material.dart';

import '../util/app_style.dart';

class StarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: AppStyle.primaryColor,
    );
  }
}
