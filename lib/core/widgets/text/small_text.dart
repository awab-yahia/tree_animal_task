import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText(
      {super.key, required this.text, required this.fontSize, this.color});

  final String text;
  final double fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? const Color(0xff333333),
          fontWeight: FontWeight.normal,
          fontSize: fontSize),
    );
  }
}
