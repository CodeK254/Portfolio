import 'dart:io';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

void downloadResume() async {
  RxString saveUrl = "".obs;
  try{
    if(!Platform.isAndroid){
      Directory? downloads = await getDownloadsDirectory();
      saveUrl.value = downloads!.path;
    } else {
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

    await FlutterDownloader.enqueue(
      url: '/home/flutter_all_projects/portfolio/assets/resume/resume.pdf',
      headers: {}, // optional: header send with url (auth token etc)
      savedDir: saveUrl.value,
      showNotification: true, // show download progress in status bar (for Android)
      openFileFromNotification: true, // click on notification to open downloaded file (for Android)
    );

  } catch (e){
    Get.snackbar(
      "Failed!!!", 
      "Error saving file. ${e.toString()}",
    );
  }
}