import 'package:get/get.dart';

class TestimonialController extends GetxController{
  final List<Map<String, dynamic>> testimonials = [
    {
      "title": "Africas Talking Mini Summit 2024 - Dedan Kimathi University of Science and Technology",
      "image": [
        "assets/images/image_001.jpg",
        "assets/images/image_005.jpg",
        "assets/images/image_009.jpg",
        "assets/images/image_011.jpg",
        "assets/images/image_014.jpg",
        "assets/images/image_016.jpg",
        "assets/images/image_017.jpg",
        "assets/images/image_018.jpg",
        "assets/images/image_020.jpg",
      ],
      "selected": 0.obs,
      "data": [
        {
          "label": "Event Details:",
          "value": "Hackathon Competition",
        },
        {
          "label": "Designated Position:",
          "value": "1st",
        },
        {
          "label": "Team Name:",
          "value": "TalkingGemini(TalkGem)",
        },
        {
          "label": "Project Presented:",
          "value": "Home Security alert system simulation",
        },
        {
          "label": "Personal role:",
          "value": "Team Leader",
        },
      ]
    },
    // {
    //   "title": "Jomo Kenyatta University of Science and Technology - Inter-University Hackathon",
    //   "image": [
    //     "assets/images/image_004.jpg",
    //   ],
    //   "selected": 0.obs,
    //   "data": [
    //     {
    //       "label": "Event Details:",
    //       "value": "Inter- University Hackathon",
    //     },
    //     {
    //       "label": "Designated Position:",
    //       "value": "2nd under IOT & Embedded Systems",
    //     },
    //     {
    //       "label": "Team Name:",
    //       "value": "Carnage",
    //     },
    //     {
    //       "label": "Project Presented:",
    //       "value": "IOT Smart Surveilance System",
    //     },
    //     {
    //       "label": "Personal role:",
    //       "value": "Team Leader",
    //     },
    //   ]
    // },
    {
      "title": "Africas Talking Mini Summit 2023 - Dedan Kimathi University of Science and Technology",
      "image": [
        "assets/images/image_006.jpg",
        "assets/images/image_007.jpg",
        "assets/images/image_008.jpg",
        "assets/images/image_012.jpg",
        "assets/images/image_013.jpg",
        "assets/images/image_015.jpg",
        "assets/images/image_019.jpg",
      ],
      "selected": 0.obs,
      "data": [
        {
          "label": "Event Details:",
          "value": "Solution's Hackathon",
        },
        {
          "label": "Designated Position:",
          "value": "Not determined...",
        },
        {
          "label": "Team Name:",
          "value": "KarU Flutter",
        },
        {
          "label": "Project Presented:",
          "value": "Cancer Patient Notification",
        },
        {
          "label": "Personal role:",
          "value": "Team Leader",
        },
      ]
    },
  ];
}