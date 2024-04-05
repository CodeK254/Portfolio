import 'package:flutter/material.dart';

TextStyle tStyle(double fontSize, int fontWeight, Color color){
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight == 0 ? FontWeight.normal : FontWeight.bold,
    color: color,
  );
}