import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxBool positionUp = false.obs;
  GlobalKey about = GlobalKey();
  GlobalKey services = GlobalKey();
  GlobalKey resume = GlobalKey();
  GlobalKey testimonial = GlobalKey();
  GlobalKey contact = GlobalKey();
  List<Map<String, dynamic>> socialIcons = [
    {"icon": FontAwesomeIcons.facebook, "label": "Facebook", "url": "https://www.facebook.com/titomc.junky", "color": Colors.blue},
    {"icon": FontAwesomeIcons.whatsapp, "label": "WhatsApp", "url": "https://wa.me/+254742143102", "color": Colors.green},
    {"icon": FontAwesomeIcons.instagram, "label": "Instagram", "url": "https://www.instagram.com/it_is_me_titus/", "color": Colors.redAccent.shade400},
    {"icon": Icons.mail, "label": "G-mail", "url": "mailto:codekarma1003@gmail.com?", "color": Colors.redAccent.shade700},
    {"icon": FontAwesomeIcons.x, "label": "X(Twitter)", "url": "https://twitter.com/CodeK254", "color": Colors.black},
    {"icon": FontAwesomeIcons.linkedinIn, "label": "LinkedIn", "url": "https://www.linkedin.com/in/titus-kariuki-b69a79218/", "color": Colors.blue.shade900},
  ];

  void scrollToSection(int section) {
    switch(section){
      case 0:
        navigateToSection(section, about);
        break;

      case 1:
        navigateToSection(section, services);
        break;

      case 2:
        navigateToSection(section, resume);
        break;

      case 3:
        navigateToSection(section, testimonial);
        break;

      default:
        navigateToSection(section, contact);
    } 
  }

  void navigateToSection(int index, GlobalKey key){
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  RxBool loading = false.obs;
  RxBool visible = true.obs;
  RxBool animate = true.obs;

  List<Map<String, dynamic>> navigation = [
    {"label": "About", "url": 0},
    {"label": "Services", "url": 710},
    {"label": "Resume", "url": 1760},
    {"label": "Testimonial", "url": 3170},
    {"label": "Contact", "url": 4390},
  ];

  RxInt selected = 0.obs;

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