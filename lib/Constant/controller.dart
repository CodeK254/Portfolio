import 'dart:async';

import 'package:get/get.dart';

class HandsOnController extends GetxController{
  final onDisplay = 0.obs;
  final ghhovering = false.obs;
  final fbhovering = false.obs;
  final ighovering = false.obs;

  final kahovering = false.obs;
  final ruhovering = false.obs;
  final kuhovering = false.obs;

  List data = [
    "Contact",
    "Educational Background",
    "Work Experience",
    "Skills",
  ];

  void alternateDisplay() {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      if(onDisplay.value != (data.length - 1)){
        onDisplay.value++;
      } else {
        onDisplay.value = 0;
      }
    });
  }

  @override
  void onInit() {
    // alternateDisplay();
    super.onInit();
  }
}