import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/app/views/home/home.dart';
import 'package:portfolio_website/app/views/loading/loading.dart';
import 'package:portfolio_website/app/views/loading/loading_controller.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          }
        )
      ),
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