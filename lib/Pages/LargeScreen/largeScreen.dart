// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/Constant/custom_spacing.dart';
import 'package:portfolio_website/Constant/custom_text.dart';
import 'package:portfolio_website/Constant/footer.dart';
import 'package:portfolio_website/Constant/hand_on_container.dart';
import 'package:portfolio_website/Constant/nav.dart';
import 'package:portfolio_website/Data/dummy.dart';
import 'package:portfolio_website/Pages/carousel_controller.dart';

class LargeScreenLayout extends StatelessWidget {
  LargeScreenLayout({super.key});

  double angle = 0;
  CarouselController carouselController = CarouselController();
  final controller = Get.put(CarController());

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const NavigatorContainer(),
        const SizedBox(width: 5),
        Expanded(
          flex: 10,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "My Profile",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900],
                  ),
                  const CustomVerticalSpacing(height: 0.02),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 105,
                        backgroundColor: Colors.brown,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage("assets/logo_two.jpg"),
                        ),
                      ),
                      const SizedBox(width: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text: "Full Name",
                                fontSize: 18,
                                textDecoration: TextDecoration.underline,
                                color: Colors.brown[700],
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.person,
                                size: 20,
                                color: Colors.brown,
                              )
                            ],
                          ),
                          const CustomVerticalSpacing(height: 0.02),
                          Container(
                            color: Colors.white,
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.5,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                text: "Titus Kariuki Kinyanjui",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          const CustomVerticalSpacing(height: 0.03),
                          Row(
                            children: [
                              CustomText(
                                text: "About",
                                fontSize: 18,
                                textDecoration: TextDecoration.underline,
                                color: Colors.brown[700],
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.edit,
                                size: 18,
                                color: Colors.brown,
                              )
                            ],
                          ),
                          const CustomVerticalSpacing(height: 0.02),
                          Container(
                            color: Colors.white,
                            constraints: BoxConstraints(
                              minWidth: 0,
                              maxWidth: MediaQuery.of(context).size.width * 0.5,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                text: "Well, just when I was at my toughest of times, just as I had approached my end, when I couldnt see any place to run to, about to lose hope, I met programming, and, I have always been happy ever since.",
                                fontSize: 15,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const CustomVerticalSpacing(height: 0.05),
                  CustomText(
                    text: "My Projects",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900],
                  ),
                  const CustomVerticalSpacing(height: 0.05),
                  CarouselSlider(
                    items: [
                      ...List.generate(
                        displayDEMO.length, 
                        (index) => Column(
                          children: [
                            ClipRect(
                              child: Image(
                                image: AssetImage("assets/demo/${displayDEMO[index]["image"]}"),
                              ),
                            ),
                            Obx(
                              () => Visibility(
                                visible: index == controller.current.value,
                                child: Container(
                                  color: Colors.white.withOpacity(0.5),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Project Name: ",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[900],
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: displayDEMO[index]["pname"].toString(),
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.blueGrey[900],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Project Description: ",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[900],
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: displayDEMO[index]["pdescription"].toString(),
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blueGrey[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Project Developer: ",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[900],
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: displayDEMO[index]["pdeveloper"].toString(),
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blueGrey[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Project Url Link: ",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: displayDEMO[index]["purl"].toString(),
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blue[400],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Project Creation Date: ",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[900],
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: displayDEMO[index]["pdate"].toString(),
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blueGrey[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ], 
                    options: CarouselOptions(
                      onPageChanged: (index, reason){
                        controller.current.value = index;
                        Animate(

                        );
                      },
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      aspectRatio: 0.9,
                      height: MediaQuery.of(context).size.height,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 10),
                      autoPlayAnimationDuration: const Duration(seconds: 5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: "The following show some sample snaps of the some of the projects both major and minor, that I have undertaken in my 1+ years of experience in Mobile Development in Flutter with Dart."
                    ),
                  ),
                  const CustomVerticalSpacing(height: 0.02),
                  CustomText(
                    text: "Project Gallery",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900],
                  ),
                  const CustomVerticalSpacing(height: 0.05),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Flutter Form DESIGNS with Validator",
                          fontSize: 20,
                          color: Colors.blueGrey,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.brown[300],
                        ),
                      ],
                    ),
                  ),
                  const CustomVerticalSpacing(height: 0.025),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          images.length, 
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                Get.dialog(
                                  AlertDialog(
                                    content: Image(
                                      image: AssetImage(images[index]),
                                    ),
                                  )
                                );
                              },
                              child: Container(
                                color: Colors.white,
                                child: Image(
                                  height: MediaQuery.of(context).size.height * 0.8,
                                  width: MediaQuery.of(context).size.width / 4,
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomVerticalSpacing(height: 0.05),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "New York Times News APP",
                          fontSize: 20,
                          color: Colors.blueGrey,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.brown[300],
                        ),
                      ],
                    ),
                  ),
                  const CustomVerticalSpacing(height: 0.025),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          imagesTwo.length, 
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                Get.dialog(
                                  AlertDialog(
                                    content: Image(
                                      image: AssetImage(imagesTwo[index]),
                                    ),
                                  )
                                );
                              },
                              child: Container(
                                color: Colors.white,
                                child: Image(
                                  height: MediaQuery.of(context).size.height * 0.8,
                                  width: MediaQuery.of(context).size.width / 4,
                                  image: AssetImage(imagesTwo[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomVerticalSpacing(height: 0.05),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Ask GPT app with OPENAI free API",
                          fontSize: 20,
                          color: Colors.blueGrey,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.brown[300],
                        ),
                      ],
                    ),
                  ),
                  const CustomVerticalSpacing(height: 0.025),
                  HandOnContainer(),
                  const CustomVerticalSpacing(height: 0.025),
                  const CustomFooter(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}