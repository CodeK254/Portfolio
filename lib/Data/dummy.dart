import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, List>> portfolio = [
  {
    "projects": [
      "Chatting App", 
      "News App", 
      ""
    ],
    "social-media": [
      {"icon": FontAwesomeIcons.twitter, "label": "Twitter", "root": "https://twitter.com/CodeK254", "color": Colors.lightBlue},
      {"icon": FontAwesomeIcons.facebook, "label": "Facebook", "root": "https://www.facebook.com/titomc.junky", "color": Colors.blue},
      {"icon": FontAwesomeIcons.instagram, "label": "Instagram", "root": "https://www.instagram.com/it_is_me_titus/", "color": Colors.redAccent.shade700},
      {"icon": FontAwesomeIcons.linkedin, "label": "LinkedIn", "root": "https://www.linkedin.com/in/titus-kariuki-b69a79218/", "color": Colors.blue[900]},
      {"icon": FontAwesomeIcons.whatsapp, "label": "WhatsApp", "root": "https://wa.me/+254742143102", "color": Colors.teal[400]}, 
    ],
    "project-snaps": [
      "assets/pjs/one.jpg",
      "assets/pjs/two.jpg",
      "assets/pjs/three.jpg",
      "assets/pjs/four.jpg",
      "assets/pjs/five.jpg",
      "assets/pjs/six.jpg",
    ],
  },
];

List<Map<String, dynamic>> projects = [
  {"label": "Best Of All Time Games", "url": "https://github.com/CodeK254/All-Games-App"},
  {"label": "AskGPT by OPEN_AI API", "url": "https://github.com/CodeK254/Flutter-ChatGPT-App"},
  {"label": "Dictionary APP", "url": "https://github.com/CodeK254/Dictionary"},
  {"label": "Form Designs", "url": "https://github.com/CodeK254/Flutter-Forms-UI-UX"},
  {"label": "Flutter WEB Course", "url": "https://github.com/CodeK254/Flutter-Web"},
  {"label": "Flutter Chat App", "url": "https://github.com/CodeK254/Flutter-Chat-App"},
  {"label": "Jokes For Geeks", "url": "https://github.com/CodeK254/jokes_for_geeks-application"},
  {"label": "World Clock App", "url": "https://github.com/CodeK254/World-Time-Apk"},
  {"label": "New York Times NEWS", "url": "https://github.com/CodeK254/Flutter-NYT-news-updates"},
  {"label": "Queue Music Player", "url": "https://github.com/CodeK254/Queue-Music"},
  {"label": "NotePAD APP", "url": "https://github.com/CodeK254/Notepad-Flutter-App"},
  {"label": "New York Times BEST-SELLER", "url": "https://github.com/CodeK254/E---Books"},
];

List<String> images = [
  "assets/images/one.png",
  "assets/images/three.png",
  "assets/images/nine.png",
  "assets/images/seven.png",
  "assets/images/five.png",
  "assets/images/six.png",
  "assets/images/eight.png",
];

List<String> imagesTwo = [
  "assets/images/ten.png",
  "assets/images/eleven.png",
  "assets/images/twelve.png",
  "assets/images/thirteen.png",
  "assets/images/forteen.png",
  "assets/images/fifteen.png",
  "assets/images/sixteen.png",
];

List<Map> displayDEMO = [
  {"image": "one.png", "pname": "Arduino Motor Driver", "pdescription": "Driving an arduino motor using an Arduino UNO, jump-wires, transistor and a breadboard.", "pdeveloper": "Titus Kariuki Kinyanjui", "purl": "https://www.tinkercad.com/things/9rCEqxUyfsq-driving-a-dc-motor-with-arduinouno", "pdate": "19th June, 2023"},
  {"image": "two.png", "pname": "Controlling an DC Motor Driver with a potentiometer.", "pdescription": "Controlling a DC motor speed using an arduino micro-controller, jump-wires, transistor, potentiometer and a breadboard.", "pdeveloper": "Titus Kariuki Kinyanjui", "purl": "https://www.tinkercad.com/things/lx8UwhxaIrZ-stunning-luulia-rottis", "pdate": "19th June, 2023"},
  {"image": "three.png", "pname": "Servo motor With Arduino", "pdescription": "Controlling a servo motor using an Arduino UNO", "pdeveloper": "Titus Kariuki Kinyanjui", "purl": "https://www.tinkercad.com/things/cng0fYA4OwC-cool-hango-wolt", "pdate": "20th June, 2023"},
  {"image": "four.png", "pname": "Working with LCD displays", "pdescription": "Liquid Crystal Display in Arduino", "pdeveloper": "Titus Kariuki Kinyanjui", "purl": "https://www.tinkercad.com/things/aRZ20mC3R8G-smooth-robo", "pdate": "19th June, 2023"},
];