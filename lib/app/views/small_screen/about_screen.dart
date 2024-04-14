import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/data/dummy.dart';
import 'package:portfolio/app/services/launcher.dart';
import 'package:portfolio/app/views/home/home_controller.dart';
import "package:get/get.dart";
import 'package:portfolio/app/widgets/spacing.dart';

class AboutSmallScreen extends StatelessWidget {
  const AboutSmallScreen({
    super.key,
    required this.homeController, required this.scrollController,
  });

  final HomeController homeController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade100,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade700,
                              offset: const Offset(-3, -3),
                              blurRadius: 14,
                            ),
                            const BoxShadow(
                              color: Colors.black,
                              offset: Offset(3, 3),
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
                      const CustomSpacing(width: .03),
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
                          Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .035),
                            child: Text(
                              "🚀 Experienced Flutter Developer Ready to Bring Your Ideas to Life! 🚀",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          ...List.generate(
                            about.length, 
                            (index) => Padding(
                              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .035),
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
                            height: MediaQuery.of(context).size.height * .025,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
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
    );
  }
}