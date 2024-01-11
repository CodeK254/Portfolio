import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/responsive/responsive.dart';
import 'package:portfolio_website/app/data/dummy.dart';
import 'package:portfolio_website/app/services/launcher.dart';
import 'package:portfolio_website/app/views/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollController.addListener((){
      
    });
    return Scaffold(
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
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Full-Stack(Software) Developer",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Expanded(child: Container()),
              ...List.generate(
                homeController.navigation.length, 
                (index) => InkWell(
                  hoverColor: Colors.grey.shade300,
                  onHover: (value){
                    
                  },
                  onTap: (){
                    homeController.selected.value = index;
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03,
                      vertical: 12,
                    ),
                    child: Text(
                      homeController.navigation[index]["label"],
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.blueGrey.shade700
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ).animate(
          effects: [
            const SlideEffect(
              begin: Offset(0, -10),
              end: Offset(0, 0),
              duration: Duration(seconds: 1),
              delay: Duration(seconds: 2),
              curve: Curves.easeInOut,
            )
          ]
        )
      ),
      body: ResponsiveWidgetScreen(
        largeScreen: Obx(
          () => Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "🚀 Experienced Flutter Developer Ready to Bring Your Ideas to Life! 🚀",
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      fontSize: 20,
                                    ),
                                  ),
                                  ...List.generate(
                                    about.length, 
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            about[index]["label"],
                                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            about[index]["data"],
                                            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                              fontSize: 14,
                                              color: Colors.grey.shade800,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).animate(
                                      effects: [
                                        SlideEffect(
                                          begin: const Offset(-10, 0),
                                          end: const Offset(0, 0),
                                          duration: const Duration(seconds: 2),
                                          delay: Duration(seconds: index * 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.2,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  height: MediaQuery.of(context).size.height * 0.4,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade100,
                                    boxShadow: [
                                      const BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-3, -3),
                                        blurRadius: 14,
                                      ),
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        offset: const Offset(3, 3),
                                        blurRadius: 14,
                                      ),
                                    ],
                                    image: const DecorationImage(
                                      image: AssetImage("assets/launcher/file.png"),
                                    )
                                  ),
                                ).animate(
                                  effects: [
                                    const SlideEffect(
                                      begin: Offset(0, -10),
                                      end: Offset(0, 0),
                                      delay: Duration(seconds: 1),
                                      duration: Duration(seconds: 1),
                                      curve: Curves.bounceOut
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Titus Kariuki",
                                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    AnimatedTextKit(
                                      totalRepeatCount: 1,
                                      animatedTexts: [
                                        TypewriterAnimatedText(
                                          "Student at Karatina University- Nyeri, Kenya. Proficient in Dart language, Flutter Framework, PHP and LARAVEL, beginner in Arduino Programming.",
                                          textStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                                            color: Colors.grey.shade800,
                                          ),
                                          speed: const Duration(milliseconds: 50),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 8,
                  left: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200
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
                                            horizontal: MediaQuery.of(context).size.width * 0.04,
                                            vertical: 8,
                                          ),
                                          child: GestureDetector(
                                            onTap: (){
                                              openUrl(homeController.socialIcons[index]["url"], homeController);
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
                                            SlideEffect(
                                              begin: const Offset(20, 0),
                                              end: const Offset(0, 0),
                                              delay: Duration(seconds: 3 + (index + 1)),
                                              duration: const Duration(seconds: 1),
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
                  ).animate(
                    effects: [
                      const SlideEffect(
                        begin: Offset(0, 10),
                        end: Offset(0, 0),
                        duration: Duration(seconds: 3),
                        delay: Duration(seconds: 3),
                      ),
                    ],
                  ),
                ),
                homeController.loading.value ? Positioned(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.teal.shade700,
                    ),
                  )
                ) : Container(),
              ],
            ),
          ),
        ),
        mediumScreen: Container(
          color: Colors.green,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        smallScreen: Obx(
          () => Stack(
            children: [
              Image(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.9,
                image: const AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover,
              ).animate(
                effects: [
                  const FadeEffect(
                    begin: 1.0,
                    end: .2,
                    duration: Duration(seconds: 3),
                    delay: Duration(seconds: 2),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade100,
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-3, -3),
                                blurRadius: 14,
                              ),
                              BoxShadow(
                                color: Theme.of(context).primaryColor,
                                offset: const Offset(3, 3),
                                blurRadius: 14,
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage("assets/launcher/file.png"),
                            )
                          ),
                        ).animate(
                          effects: [
                            const SlideEffect(
                              begin: Offset(0, -10),
                              end: Offset(0, 0),
                              delay: Duration(seconds: 1),
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceOut
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Titus Kariuki",
                                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              AnimatedTextKit(
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    "Student at Karatina University- Nyeri, Kenya. Proficient in Dart language, Flutter Framework, PHP and LARAVEL, beginner in Arduino Programming.",
                                    textStyle: Theme.of(context).textTheme.displaySmall,
                                    speed: const Duration(milliseconds: 50),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "🚀 Experienced Flutter Developer Ready to Bring Your Ideas to Life! 🚀",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            ...List.generate(
                              about.length, 
                              (index) => Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      about[index]["label"],
                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      about[index]["data"],
                                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ).animate(
                                effects: [
                                  SlideEffect(
                                    begin: const Offset(-10, 0),
                                    end: const Offset(0, 0),
                                    duration: const Duration(seconds: 2),
                                    delay: Duration(seconds: index * 2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                left: 8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    color: Theme.of(context).primaryColor,
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
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Social Media:",
                                  style: Theme.of(context).textTheme.displayMedium,
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ...List.generate(
                                      homeController.socialIcons.length, (index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            openUrl(homeController.socialIcons[index]["url"], homeController);
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
                                          SlideEffect(
                                            begin: const Offset(20, 0),
                                            end: const Offset(0, 0),
                                            delay: Duration(seconds: 3 + (index + 1)),
                                            duration: const Duration(seconds: 1),
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
                ).animate(
                  effects: [
                    const SlideEffect(
                      begin: Offset(0, 20),
                      end: Offset(0, 0),
                      duration: Duration(seconds: 3),
                      delay: Duration(seconds: 3),
                    ),
                  ],
                ),
              ),
              homeController.loading.value ? Positioned(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal.shade700,
                  ),
                )
              ) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}