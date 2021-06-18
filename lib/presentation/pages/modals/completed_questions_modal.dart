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
            width: double.infinity,
            height: double.infinity,
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
            child: _buldContentMessage(percent: controller.hitsPercent.toInt()),
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
            child: _buildStars(percent: controller.hitsPercent.toInt()),
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
                    controller.startTimer();
                    controller.isPlaying.value = true;
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

  Widget _buildStars({required int percent}) {
    if (percent == 100) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StarIcon(),
          StarIcon(),
          StarIcon(),
          StarIcon(),
          StarIcon(),
        ],
      );
    } else if (percent >= 70) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StarIcon(),
          StarIcon(),
          StarIcon(),
        ],
      );
    } else if (percent >= 40) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StarIcon(),
          StarIcon(),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StarIcon(),
        ],
      );
    }
  }

  Widget _buldContentMessage({required int percent}) {
    late String title;
    late String message;
    if (percent == 100) {
      title = "Parabéns!";
      message = "Você conseguiu completar todas as questões!\n$percent% de acertos.";
    } else if (percent >= 70) {
      title = "Parabéns!";
      message = "Você acertou muitas questões!\n$percent% de acertos.";
    } else if (percent >= 40) {
      title = "Parabéns!";
      message = "Você conseguiu acertar $percent% das questões.";
    } else {
      title = "Tente Novamente!";
      message = "Você não foi muito bem. Acertou apenas $percent% das questões.";
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacing.normal(),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        Spacing.normal(),
      ],
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
