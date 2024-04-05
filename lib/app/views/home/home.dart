import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/views/home/home_controller.dart';
import 'package:portfolio/app/views/large_screen/about_screen.dart';
import 'package:portfolio/app/views/large_screen/services_screen.dart';
import 'package:portfolio/app/views/large_screen/testimonial_screen.dart';
import 'package:portfolio/app/views/small_screen/about_screen.dart';
import 'package:portfolio/responsive/responsive.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollController.addListener((){
      if(scrollController.offset >= 10){
        homeController.showBottomBar(false);
      } else {
        homeController.animate.value = false;
        homeController.showBottomBar(true);
      }
    });
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: ResponsiveWidgetScreen.isSmallScreen(context) ? AppBar(
        title: Text(
          "Full-Stack(Software) Developer",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context){
              return [
                ...List.generate(
                  homeController.navigation.length, 
                  (index) => PopupMenuItem(
                    child: Text(
                      homeController.navigation[index]["label"],
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    onTap: (){
                      Get.toNamed(homeController.navigation[index]["url"]);
                    },
                  ),
                ),
              ];
            }
          ),
        ],
      ) : PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          70,
        ), 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Container()),
              ...List.generate(
                homeController.navigation.length, 
                (index) => Obx(
                  () => InkWell(
                    hoverColor: Colors.grey.shade300,
                    onHover: (value){
                      
                    },
                    onTap: (){
                      homeController.selected.value = index;
                      homeController.setAllBlack();
                      homeController.colors[homeController.selected.value] = Colors.white;
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                        vertical: 6,
                      ),
                      child: Text(
                        homeController.navigation[index]["label"],
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: homeController.selected.value == index ? Colors.white : Colors.blueGrey.shade700
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ).animate(
          effects: [
            homeController.animate.value ? const SlideEffect(
              begin: Offset(0, -10),
              end: Offset(0, 0),
              duration: Duration(seconds: 1),
              delay: Duration(seconds: 2),
              curve: Curves.easeInOut,
            ) : const Effect(),
          ],
        ),
      ),
      body: Obx(
        () => ResponsiveWidgetScreen(
          largeScreen: homeController.toDisplay(
            [
              AboutLargeScreen(scrollController: scrollController, homeController: homeController),
              ServicesLargeScreen(),
              TestimonialScreen(),
            ], 
            homeController.selected.value
          ),
          mediumScreen: Container(
            color: Colors.green,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          smallScreen: AboutSmallScreen(homeController: homeController),
        ),
      ),
    );
  }
}