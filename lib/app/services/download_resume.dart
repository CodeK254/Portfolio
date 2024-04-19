// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';
import 'package:get/get.dart';

void downloadDocument() async {
    try{
      final AnchorElement anchorElement = AnchorElement(href: "/assets/resume/Titus_Kariuki_Resume.jpg");
      anchorElement.download = "Titus Kariuki Resume.png";
      anchorElement.click();
    } catch(e){
      Get.snackbar(
      "Failed!!!", 
      "Error saving file. ${e.toString()}",
    );
  }
}