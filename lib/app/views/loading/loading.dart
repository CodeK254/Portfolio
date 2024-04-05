// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/views/loading/loading_controller.dart';

class FlutterLoadingLogo extends StatelessWidget {
  FlutterLoadingLogo({super.key});

  LoadingController loadingController = Get.find<LoadingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: loadingController.rotateAnimationController!,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.rotationZ(loadingController.rotateAnimation!.value),
            alignment: Alignment.center,
            child: ScaleTransition(
              scale: loadingController.scalingAnimationController!,
              child: const Center(
                child: Image(
                  image: AssetImage("assets/launcher/portfolio1.png"),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}