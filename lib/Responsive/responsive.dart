// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

const int largeScreenSize = 1160;
const int smallScreenSize = 850;

class ResponsiveWidgetScreen extends StatelessWidget {
  final Widget smallScreen;
  Widget? mediumScreen;
  final Widget largeScreen;
  ResponsiveWidgetScreen({super.key, required this.smallScreen, required this.largeScreen, this.mediumScreen});

  static bool isSmallScreen(context){
    return MediaQuery.of(context).size.width <= smallScreenSize;
  }

  static bool isMediumScreen(context){
    return MediaQuery.of(context).size.width > smallScreenSize && MediaQuery.of(context).size.width < largeScreenSize;
  }

  static bool isLargeScreen(context){
    return MediaQuery.of(context).size.width >= largeScreenSize;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        debugPrint("Size is: ${constraints.maxWidth}");
        if(constraints.maxWidth <= smallScreenSize){
          return smallScreen;
        } else if(constraints.maxWidth > smallScreenSize && constraints.maxWidth < largeScreenSize){
          return mediumScreen ?? largeScreen;
        } else {
          return largeScreen;
        }
      }
    );
  }
}