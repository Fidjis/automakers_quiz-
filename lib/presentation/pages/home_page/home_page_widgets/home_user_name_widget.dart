import 'package:automakers_quiz/presentation/pages/home_page/home_page_controller.dart';
import 'package:automakers_quiz/presentation/util/app_style.dart';
import 'package:automakers_quiz/presentation/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_quetions_widget.dart';

class UserNameWidget extends GetView<HomePageController> {
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final title = Text(
      'Insira seu nome de usuario:',
      style: TextStyle(
        color: AppStyle.segundaryColor,
        fontSize: 22,
      ),
    );
    final nickNameInput = Card(
      shape: StadiumBorder(side: BorderSide(color: AppStyle.segundaryColor, width: 2.0)),
      child: TextFormField(
        autofocus: false,
        controller: controller.nickName,
        decoration: InputDecoration(
          hintText: 'Nick',
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Insira um valor!';
          }
          return null;
        },
      ),
    );
    final button = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: FloatingActionButton.extended(
        backgroundColor: AppStyle.segundaryColor,
        onPressed: () {
          if (formKey.currentState!.validate()) controller.changeChildOfSlidWidgetSlidAnimation(QuestionsWidget());
        },
        label: Icon(
          Icons.play_arrow,
          color: AppStyle.primaryColor,
        ),
      ),
    );

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title,
            Spacing.normal(),
            nickNameInput,
            Spacing.normal(),
            Padding(padding: EdgeInsets.only(top: 20), child: button),
          ],
        ),
      ),
    );
  }
}
