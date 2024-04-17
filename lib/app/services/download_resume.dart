import 'dart:io';
import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

void downloadResume() async {
  RxString saveUrl = "".obs;
  try{
    if(!Platform.isAndroid){
      Directory? downloads = await getDownloadsDirectory();
      saveUrl.value = downloads!.path;
    } else if(!kIsWeb) {
      Directory downloads = Directory("/storage/emulated/0/Downloads");
      saveUrl.value = downloads.path;
    }

    // File file = File("/home/flutter_all_projects/portfolio/assets/resume/resume.pdf");

    // File toSaved = await File("${saveUrl.value}/Titus Kariuki Resume.pdf").create();
    // toSaved.writeAsBytesSync(file.readAsBytesSync());

    // Get.snackbar(
    //   "Success!!!", 
    //   "File saved to: ${toSaved.path}"
    // );

  } catch (e){
    Get.snackbar(
      "Failed!!!", 
      "Error saving file. ${e.toString()}",
    );
  }
}