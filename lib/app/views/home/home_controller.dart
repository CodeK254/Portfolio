import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  List<Map<String, dynamic>> socialIcons = [
    {"icon": FontAwesomeIcons.facebook, "label": "Facebook", "url": "https://www.facebook.com/titomc.junky", "color": Colors.blue},
    {"icon": FontAwesomeIcons.whatsapp, "label": "WhatsApp", "url": "https://wa.me/+254742143102", "color": Colors.green},
    {"icon": FontAwesomeIcons.instagram, "label": "Instagram", "url": "https://www.instagram.com/it_is_me_titus/", "color": Colors.redAccent.shade400},
    {"icon": Icons.mail, "label": "G-mail", "url": "mailto:codekarma1003@gmail.com?", "color": Colors.redAccent.shade700},
    {"icon": FontAwesomeIcons.x, "label": "X(Twitter)", "url": "https://twitter.com/CodeK254", "color": Colors.black},
    {"icon": FontAwesomeIcons.linkedinIn, "label": "LinkedIn", "url": "https://www.linkedin.com/in/titus-kariuki-b69a79218/", "color": Colors.blue.shade900},
  ];

  RxBool loading = false.obs;
  RxBool visible = true.obs;
  RxBool animate = true.obs;

  List<Map<String, dynamic>> navigation = [
    {"label": "About", "url": "/about"},
    {"label": "Services", "url": "/services"},
    {"label": "Testimonial", "url": "/testimonial"},
    {"label": "Contact", "url": "/contact"},
  ];

  RxInt selected = 2.obs;

  List<Color> colors = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];

  void setAllBlack(){
    for(Color item in colors){
      colors[colors.indexOf(item)] = Colors.black;
    }
  }

  showBottomBar(bool value) async {
    visible.value = value;
  }

  Widget toDisplay(List<Widget> widgets, int index){
    return widgets[index];
  }
}