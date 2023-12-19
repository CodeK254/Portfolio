import 'package:flutter/material.dart';

class CustomVerticalSpacing extends StatelessWidget {
  final double height;
  const CustomVerticalSpacing({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height,
    );
  }
}

class CustomHorizontalSpacing extends StatelessWidget {
  final double width;
  const CustomHorizontalSpacing({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * width,
    );
  }
}