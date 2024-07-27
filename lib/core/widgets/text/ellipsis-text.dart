import 'package:flutter/material.dart';

class EllipsisText extends StatelessWidget {
  const EllipsisText(
      {super.key,
      required this.text,
      this.style,
      this.fontWeight,
      this.color,
      this.fontSize,
      this.maxLine,
      this.align});
  final String text;
  final TextStyle? style;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final TextAlign? align;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    // ===========> read me <===========
    // i wrap text wedget inside row so i can be able to use expanded
    // which its nssry for doing maxline and textEllipsis bc now we need to
    // make constraint on width to start making new line so its diffrent from
    //small text and big tex widgets
    //
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            textAlign: align ?? TextAlign.center,
            style: style ??
                TextStyle(
                  color: color ?? const Color(0xff333333),
                  fontSize: fontSize ?? 14,
                  fontWeight: fontWeight ?? FontWeight.normal,
                ),

            //
            maxLines: maxLine ?? 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
