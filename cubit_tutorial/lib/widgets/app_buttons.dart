import 'package:cubit_tutorial/theme/colors.dart';
import 'package:cubit_tutorial/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final String? text;
  final IconData? icon;
  final Color backgroundColor;
  final double size;
  final Color borderColor;

  const AppButtons({
    Key? key,
    this.text,
    this.icon,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Center(
        child: text == null
            ? Icon(
                icon,
                color: color,
              )
            : AppText(
                text: text!,
                color: Colors.black,
              ),
      ),
    );
  }
}
