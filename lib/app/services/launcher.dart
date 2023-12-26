import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio_website/app/views/home/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

void openUrl(String url, HomeController homeController) async {
  try{
    homeController.loading.value = true;
    await launchUrl(Uri.parse(url));
    homeController.loading.value = false;
  } catch(e){
    homeController.loading.value = false;
    Fluttertoast.showToast(
      msg: "$e",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.grey.shade300,
      textColor: Colors.blueGrey.shade800,
    );
  }
}