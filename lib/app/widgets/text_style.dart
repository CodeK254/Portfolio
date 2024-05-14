import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle tStyle(double fontSize, int fontWeight, Color color){
  return GoogleFonts.ubuntu(
    fontSize: fontSize,
    fontWeight: fontWeight == 0 ? FontWeight.normal : FontWeight.bold,
    color: color,
  );
}