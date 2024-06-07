import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResumeController extends GetxController{
  RxInt leftStepperSelected = 0.obs;
  RxInt righttepperSelected = 0.obs;

  List<String> techStack = [
    "Cross-platform development",
    "Database Administration",
    "IT Support",
    "IT tutoring and training",
    "IoT and Embedded Systems",
    "Backend Development",
    "API Development and Integration",
    "Database Design and Development"
  ];

  List<Map<String, dynamic>> resumeInfo = [
    {
      "title": "Summary",
      "subtitle": "Titus Kariuki Kinyanjui",
      "description": [
        """
Mobile Application Developer with over two years working with Flutter cross-platform framework to develop high quality,
modernized user interface / user experience (UI/UX) for both Android and iOS, Windows, MacOS and Linux distros, static websites and dynamic web applications (web apps).
""",
      ]
    },
    {
      "title": "Education",
      "subtitle": "Bachelor of Science in Computer Science - 2020 to 2024",
      "description": [
        "I enrolled at Karatina University 2020 to pursue a BSC course in Computer Science, where I was introduced to programming concepts, database designs and management among other various concepts.",
        "I developed a taste in Android development in Java until I came to hear about cross-platform development using a single codebase in Flutter where I chose to venture it, now in my third year of writing Dart(Flutter) code and building proficiency in it's integrations as well.",
        "Throught my programming journey, it has sharpened my analytical and problem-solving skills. I have been shaped into a goal oriented person with a good understanding of breaking complex problems into smaller sub-problems for easier solving."
      ]
    },
  ];

  List<Map<String, dynamic>> workExperience = [
    {
      "subtitle": "IT Support - LAPSSET Corridor Development Autority, 2023",
      "description": [
        "Worked as an IT hardware and software support under the the LCDA ICT department.",
      ]
    },
    {
      "subtitle": "Mobile Application Development - Pick & Drop, 2023 - 2024",
      "description": [
        "Worked on a remote collaboration project from a delivery cross-plaftorm mobile application for 'Pick & Drop' organization based in Oman governorate. \nWorked on Flutter for mobile experience development and Firebase for authentication and cloud firestore database.",
      ]
    },
    {
      "subtitle": "Mobile Application Development - Onix Market, 2023 - 2024",
      "description": [
        "Working solo on a mobile application for Onix-Market organization based in Nairobi, Kenya. \nIncharge of development, API integation and testing.",
      ]
    },
  ];

  List<Map<String, dynamic>> learning = [
    {
      "language": "PHP",
      "percentage": 90,
      "color": Colors.blueGrey,
    },
    {
      "language": "Java",
      "percentage": 60,
      "color": Colors.green,
    },
    {
      "language": "Dart",
      "percentage": 98,
      "color": Colors.blue,
    },
    {
      "language": "Laravel",
      "percentage": 80,
      "color": Colors.redAccent.shade400,
    },
    {
      "language": "Flutter",
      "percentage": 98,
      "color": Colors.blue,
    },
    {
      "language": "C++",
      "percentage": 80,
      "color": Colors.blue.shade900,
    },
  ];
}