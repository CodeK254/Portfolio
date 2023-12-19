import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/views/loading/loading.dart';
import 'package:portfolio/app/views/loading/loading_controller.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => FlutterLoadingLogo(),
          binding: BindingsBuilder(() {
            Get.lazyPut<LoadingController>(() => LoadingController());
          }),
        ),
      ],
    )
  );
}