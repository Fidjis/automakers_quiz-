import 'package:automakers_quiz/presentation/pages/home_page/home_page_controller.dart';
import 'package:automakers_quiz/presentation/pages/home_page/home_page_widgets/home_quetions_widget.dart';
import 'package:automakers_quiz/presentation/util/app_style.dart';
import 'package:automakers_quiz/presentation/widgets/spacing.dart';
import 'package:automakers_quiz/presentation/widgets/star_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RankingModal extends GetView<HomePageController> {
  final ranquingItems = ['Tel', 'John', 'Jorge', 'Liz', 'Ze'];

  Widget build(BuildContext context) {
    final title = Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          'Ranking',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
    final options = Flexible(
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: ranquingItems.length,
          itemBuilder: (BuildContext context, int position) {
            return InkWell(
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
                          ranquingItems[position],
                          style: TextStyle(color: AppStyle.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
    final button = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: FloatingActionButton.extended(
        backgroundColor: AppStyle.segundaryColor,
        onPressed: () => controller.changeChildOfSlidWidgetSlidAnimation(QuestionsWidget()),
        label: Icon(
          Icons.play_arrow,
          color: AppStyle.primaryColor,
        ),
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Spacing.extraSmall(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StarIcon(),
            StarIcon(),
            StarIcon(),
          ],
        ),
        Spacing.extraSmall(),
        title,
        Spacing.extraSmall(),
        options,
        Spacing.extraSmall(),
        button,
      ],
    );
  }
}
