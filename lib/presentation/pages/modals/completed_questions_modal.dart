import 'package:automakers_quiz/presentation/pages/home_page/home_page_controller.dart';
import 'package:automakers_quiz/presentation/pages/home_page/home_page_widgets/home_quetions_widget.dart';
import 'package:automakers_quiz/presentation/pages/home_page/home_page_widgets/home_user_name_widget.dart';
import 'package:automakers_quiz/presentation/util/app_style.dart';
import 'package:automakers_quiz/presentation/widgets/spacing.dart';
import 'package:automakers_quiz/presentation/widgets/star_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedQuestionsModal extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: Consts.avatarRadius + Consts.padding,
              bottom: Consts.avatarRadius + Consts.padding,
              left: Consts.padding,
              right: Consts.padding,
            ),
            margin: EdgeInsets.only(top: 0, bottom: 25),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(Consts.padding),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Text(
                  "Parabéns!",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacing.normal(),
                Text(
                  "Você conseguiu completar todas as questões!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                Spacing.normal(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Consts.avatarRadius),
            child: Image(
              image: new AssetImage("assets/confete.gif"),
            ),
          ),
          Positioned(
            left: Consts.padding,
            right: Consts.padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StarIcon(),
                StarIcon(),
                StarIcon(),
                StarIcon(),
                StarIcon(),
              ],
            ),
          ),
          Positioned(
            left: Consts.padding,
            right: Consts.padding,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: AppStyle.primaryColor,
                  onPressed: () {
                    controller.resetQuestions();
                    controller.changeChildOfSlidWidgetSlidAnimation(QuestionsWidget());
                    Navigator.pop(context);
                  },
                  mini: true,
                  child: Icon(Icons.refresh),
                ),
                FloatingActionButton.extended(
                  backgroundColor: AppStyle.primaryColor,
                  onPressed: () {
                    controller.nickName.text = '';
                    controller.changeChildOfSlidWidgetSlidAnimation(UserNameWidget());
                    Navigator.pop(context);
                  },
                  label: Text('Novo Jogo'),
                ),
                FloatingActionButton(
                  backgroundColor: AppStyle.primaryColor,
                  onPressed: () => Navigator.pop(context),
                  mini: true,
                  child: Icon(Icons.close),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
