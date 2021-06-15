import 'package:automakers_quiz/presentation/util/app_style.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 100.0,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildBackgroundAppName(),
          buildBackgroundAppNameShadow(),
        ],
      ),
    );
  }

  Widget buildBackgroundAppName() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Text(
        "Automakers Quiz",
        style: TextStyle(
          color: AppStyle.primaryColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildBackgroundAppNameShadow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7.0, 7.0, 0.0, 0.0),
      child: Text(
        "Automakers Quiz",
        style: TextStyle(
          color: AppStyle.segundaryColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
