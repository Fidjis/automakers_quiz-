import 'package:flutter/material.dart';

class MenuButtonWidget extends StatelessWidget {
  const MenuButtonWidget({
    Key? key,
    required this.text,
    required this.iconData,
    this.onPressed,
    required this.color,
  }) : super(key: key);

  final String text;
  final IconData iconData;
  final Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(
            iconData,
            color: color,
            size: 35,
          ),
          onPressed: onPressed,
        ),
        Text(text, style: TextStyle(color: color))
      ],
    );
  }
}
