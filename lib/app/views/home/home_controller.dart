import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  List<Map<String, dynamic>> socialIcons = [
    {"icon": FontAwesomeIcons.facebook, "label": "Facebook", "url": "", "color": Colors.blue},
    {"icon": FontAwesomeIcons.whatsapp, "label": "WhatsApp", "url": "", "color": Colors.green},
    {"icon": Icons.mail, "label": "G-mail", "url": "", "color": Colors.redAccent.shade700},
    {"icon": FontAwesomeIcons.x, "label": "X(Twitter)", "url": "", "color": Colors.black},
    {"icon": FontAwesomeIcons.linkedinIn, "label": "LinkedIn", "url": "", "color": Colors.blue.shade900},
  ];
}