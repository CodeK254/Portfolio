import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/app/views/home/home.dart';
import 'package:portfolio_website/app/views/loading/loading.dart';
import 'package:portfolio_website/app/views/loading/loading_controller.dart';
import 'package:portfolio_website/utils/theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: lightTheme,
      getPages: [
        GetPage(
          name: "/",
          page: () => FlutterLoadingLogo(),
          binding: BindingsBuilder(() {
            Get.lazyPut<LoadingController>(() => LoadingController());
          }),
        ),
        GetPage(
          name: "/home",
          page: () => HomeScreen(),
          binding: BindingsBuilder(() {
            
          }),
        ),
      ],
    )
  );
}