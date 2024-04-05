import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.highContrastLight(),
  primaryColor: Colors.grey.shade200,
  appBarTheme: const AppBarTheme(
    toolbarHeight: 65,
    elevation: 0.4,
    backgroundColor: Colors.black,
    shadowColor: Colors.grey,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  textTheme: TextTheme(
    titleSmall: const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      color: Colors.grey.shade900,
    ),
    displaySmall: TextStyle(
      fontSize: 12,
      color: Colors.grey.shade700,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.highContrastDark(),
  primaryColor: Colors.grey.shade800,
  appBarTheme: const AppBarTheme(
    toolbarHeight: 65,
    elevation: 0.4,
    backgroundColor: Colors.black,
    shadowColor: Colors.grey,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  textTheme: TextTheme(
    titleSmall: const TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      color: Colors.grey.shade100,
    ),
    displaySmall: TextStyle(
      fontSize: 12,
      color: Colors.grey.shade400,
    ),
  ),
);