// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  double? fontSize;
  double? letterSpacing;
  Color? color;
  TextAlign? textAlign;
  TextDecoration? textDecoration;
  FontWeight? fontWeight;
  TextOverflow? overflow;

  CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.letterSpacing,
    this.color,
    this.textAlign,
    this.textDecoration,
    this.fontWeight,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        color: color ?? Colors.black87,
        letterSpacing: letterSpacing,
        decoration: textDecoration ?? TextDecoration.none,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: textAlign ?? TextAlign.left,
      overflow: overflow ?? TextOverflow.visible,
    );
  }
}
