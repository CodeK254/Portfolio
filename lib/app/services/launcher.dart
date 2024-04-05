import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String  url) async {
  try{
    await launchUrl(Uri.parse(url));
  } catch(e){
    Get.snackbar("Error!!!", "Unable to launch Url");
  }
}