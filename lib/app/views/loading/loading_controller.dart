import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController with GetTickerProviderStateMixin{
  AnimationController? scalingAnimationController;
  Animation? scalingAnimation;

  AnimationController? rotateAnimationController;
  Animation? rotateAnimation;

  RxInt val = 0.obs;

  @override
  void onInit() {
    scalingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      upperBound: 2.5,
      lowerBound: 1,
    );

    scalingAnimation = Tween<double>(
      begin: 0.0,
      end: pi,
    ).animate(CurvedAnimation(parent: scalingAnimationController!, curve: Curves.bounceInOut));

    scalingAnimationController!.forward();

    rotateAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(CurvedAnimation(parent: rotateAnimationController!, curve: Curves.bounceOut));

    scalingAnimationController!.addListener(() {
      if(scalingAnimationController!.isCompleted){
        rotateAnimationController!.forward();
      } else if(scalingAnimationController!.isDismissed){
        rotateAnimationController!.reverse();
      }
    });

    rotateAnimationController!.addListener(() async {
      if(rotateAnimationController!.isCompleted){
        await Future.delayed(const Duration(seconds: 2));
        scalingAnimationController!.reverse();
      } else if(rotateAnimationController!.isDismissed){
        Get.offNamed("/home");
      }
    });

    super.onInit();
  }

  @override
  void dispose() {
    rotateAnimationController!.dispose();
    scalingAnimationController!.dispose();
    super.dispose();
  }
}