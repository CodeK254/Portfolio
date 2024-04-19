import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/views/contact/contact_controller.dart';
import 'package:portfolio/app/views/large_screen/map_side.dart';
import 'package:portfolio/app/views/home/home.dart';
import 'package:portfolio/app/views/home/home_controller.dart';
import 'package:portfolio/app/views/loading/loading.dart';
import 'package:portfolio/app/views/loading/loading_controller.dart';
import 'package:portfolio/utils/theme.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      initialRoute: "/home",
      unknownRoute: GetPage(
        name: "/",
        page: () => FlutterLoadingLogo(),
        binding: BindingsBuilder(() {
          Get.lazyPut<LoadingController>(() => LoadingController());
        }),
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
            Get.lazyPut<HomeController>(() => HomeController());
          }),
        ),
        GetPage(
          name: "/contact",
          page: () => const ContactMeScreen(),
          binding: BindingsBuilder(() {
            Get.lazyPut<ContactController>(() => ContactController());
          }),
        )
      ],
    )
  );
}