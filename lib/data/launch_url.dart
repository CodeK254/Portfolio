import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

void navigateTo(String link){
  try{
    launchUrl(Uri.parse(link));
  } catch(e){
    debugPrint("Error!!! $e");
  }
}