import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/services/launcher.dart';
import 'package:portfolio/app/views/home/home_controller.dart';
import 'package:portfolio/app/views/large_screen/about_screen.dart';
import 'package:portfolio/app/views/large_screen/contact_screen.dart';
import 'package:portfolio/app/views/large_screen/resume_screen.dart';
import 'package:portfolio/app/views/large_screen/services_screen.dart';
import 'package:portfolio/app/views/medium_screen/testimonial_screen.dart';
import 'package:portfolio/app/views/small_screen/about_screen.dart';
import 'package:portfolio/app/views/small_screen/contact_screen.dart';
import 'package:portfolio/app/views/small_screen/resume_screen.dart';
import 'package:portfolio/app/views/small_screen/services_screen.dart';
import 'package:portfolio/app/widgets/spacing.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:portfolio/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();
  final ScrollController scrollController = ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    scrollController.addListener((){
      homeController.position.value = scrollController.position.pixels;
    });
    return Obx(
      () => Scaffold(
        appBar: ResponsiveWidgetScreen.isSmallScreen(context) ? AppBar(
          title: Text(
            "Full-Stack(Software) Developer",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          actions: [
            Obx(
              () => PopupMenuButton(
                initialValue: homeController.selected.value,
                color: KColors.backGroundGrey,
                itemBuilder: (context){
                  return [
                    ...List.generate(
                      homeController.navigation.length, 
                      (index) => PopupMenuItem(
                        child: Text(
                          homeController.navigation[index]["label"],
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: KColors.lightDarkTextColor,
                          ),
                        ),
                        onTap: (){
                          homeController.selected.value = index;
                          homeController.setAllBlack();
                          homeController.colors[homeController.selected.value] = KColors.blue;
                        },
                      ),
                    ),
                  ];
                }
              ),
            ),
          ],
        ) : PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            0,
          ),
          child: Container(),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade100,
                Colors.white,
                Colors.grey.shade100,
                Colors.grey.shade300,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage("assets/images/image_001.jpg"),
              //   fit: BoxFit.cover,
              //   opacity: .03,
              // )
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: !ResponsiveWidgetScreen.isSmallScreen(context) ? Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        AboutLargeScreen(
                          homeController: homeController,
                          scrollController: scrollController,
                        ),
                        Positioned(
                          top: 10,
                          left: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .23,
                            height: MediaQuery.of(context).size.height * .2,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade100,
                              borderRadius: BorderRadius.only(
                                topRight: const Radius.circular(20),
                                bottomRight: Radius.circular(MediaQuery.of(context).size.width * .33),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 20,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .23,
                            height: MediaQuery.of(context).size.height * .2,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade100,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(MediaQuery.of(context).size.width * .33),
                                bottomLeft: const Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomSpacing(height: .1),
                  ServicesLargeScreen(),
                  const CustomSpacing(height: .1),
                  ResumeLargeScreen(),
                  const CustomSpacing(height: .06),
                  TestimonialMediumScreen(),
                  const CustomSpacing(height: .06),
                  ContactLargeScreen(),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                          Container(
                            decoration: BoxDecoration(
                              color: KColors.backGroundGrey,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(-5, -5),
                                  color: KColors.containerUpperShadowColor,
                                  blurRadius: 10,
                                ),
                                BoxShadow(
                                  offset: const Offset(5, 5),
                                  color: KColors.containerLowerShadowColor,
                                  blurRadius: 20,
                                ),
                              ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              ...List.generate(
                                                homeController.socialIcons.length, (index) => Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: MediaQuery.of(context).size.width * 0.01,
                                                    vertical: 8,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: (){
                                                      openUrl(homeController.socialIcons[index]["url"]);
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Icon(
                                                          homeController.socialIcons[index]["icon"],
                                                          size: 22,
                                                          color: homeController.socialIcons[index]["color"],
                                                        ),
                                                        const SizedBox(height: 3),
                                                        Text(
                                                          homeController.socialIcons[index]["label"],
                                                          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                                            fontSize: 10,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ).animate(
                                                  effects: [
                                                    FadeEffect(
                                                      begin: 0,
                                                      end: 1,
                                                      delay: Duration(milliseconds: (index + 200)),
                                                      duration: const Duration(milliseconds: 300),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: .3,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Copyright policy ",
                                        style: Theme.of(context).textTheme.displaySmall,
                                      ),
                                      const Icon(
                                        Icons.copyright,
                                        size: 18,
                                        color: Colors.blueGrey,
                                      ),
                                      Text(
                                        " December 25, 2023",
                                        style: Theme.of(context).textTheme.displaySmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ) : Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        AboutSmallScreen(
                          homeController: homeController,
                          scrollController: scrollController,
                        ),
                        Positioned(
                          top: 10,
                          left: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .23,
                            height: MediaQuery.of(context).size.height * .2,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade100,
                              borderRadius: BorderRadius.only(
                                topRight: const Radius.circular(20),
                                bottomRight: Radius.circular(MediaQuery.of(context).size.width * .33),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 20,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .23,
                            height: MediaQuery.of(context).size.height * .2,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade100,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(MediaQuery.of(context).size.width * .33),
                                bottomLeft: const Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomSpacing(height: .1),
                  ServicesSmallScreen(),
                  const CustomSpacing(height: .1),
                  ResumeSmallScreen(),
                  const CustomSpacing(height: .06),
                  TestimonialMediumScreen(),
                  const CustomSpacing(height: .06),
                  ContactSmallScreen(),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                          Container(
                            decoration: BoxDecoration(
                              color: KColors.backGroundGrey,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(-5, -5),
                                  color: KColors.containerUpperShadowColor,
                                  blurRadius: 10,
                                ),
                                BoxShadow(
                                  offset: const Offset(5, 5),
                                  color: KColors.containerLowerShadowColor,
                                  blurRadius: 20,
                                ),
                              ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              ...List.generate(
                                                homeController.socialIcons.length, (index) => Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: MediaQuery.of(context).size.width * 0.01,
                                                    vertical: 8,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: (){
                                                      openUrl(homeController.socialIcons[index]["url"]);
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Icon(
                                                          homeController.socialIcons[index]["icon"],
                                                          size: 22,
                                                          color: homeController.socialIcons[index]["color"],
                                                        ),
                                                        const SizedBox(height: 3),
                                                        Text(
                                                          homeController.socialIcons[index]["label"],
                                                          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                                            fontSize: 10,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ).animate(
                                                  effects: [
                                                    FadeEffect(
                                                      begin: 0,
                                                      end: 1,
                                                      delay: Duration(milliseconds: (index + 200)),
                                                      duration: const Duration(milliseconds: 300),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: .3,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Copyright policy ",
                                        style: Theme.of(context).textTheme.displaySmall,
                                      ),
                                      const Icon(
                                        Icons.copyright,
                                        size: 18,
                                        color: Colors.blueGrey,
                                      ),
                                      Text(
                                        " December 25, 2023",
                                        style: Theme.of(context).textTheme.displaySmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Visibility(
          visible: homeController.position.value > 500.0,
          child: Tooltip(
            message: "Return to top",
            child: FloatingActionButton(
              onPressed: (){
                scrollController.animateTo(0, duration: Duration(milliseconds: 3000 + homeController.position.value.toInt()), curve: Curves.easeInCirc);
                homeController.selected.value = 0;
              },
              mini: true,
              backgroundColor: KColors.blue,
              child: const Icon(
                CupertinoIcons.arrow_up,
                size: 20,
                color: Colors.white60,
              ),
            ),
          ),
        ),
      ),
    );
  }
}