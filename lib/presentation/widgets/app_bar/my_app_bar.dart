import 'package:automakers_quiz/presentation/util/app_style.dart';
import 'package:flutter/material.dart';

import '../star_icon_widget.dart';
import 'widgets/app_title_widget.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
