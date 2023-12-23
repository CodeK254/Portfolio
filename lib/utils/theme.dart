import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.highContrastLight(),
  appBarTheme: AppBarTheme(
    toolbarHeight: 65,
    elevation: 0.4,
    backgroundColor: Colors.white,
    shadowColor: Colors.grey,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  textTheme: TextTheme(
    titleSmall: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
);