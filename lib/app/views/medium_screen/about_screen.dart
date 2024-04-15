import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/data/dummy.dart';
import 'package:portfolio/app/services/launcher.dart';
import 'package:portfolio/app/views/home/home_controller.dart';
import "package:get/get.dart";
import 'package:portfolio/app/widgets/spacing.dart';

class AboutMediumScreen extends StatelessWidget {
  const AboutMediumScreen({
    super.key,
    required this.scrollController,
    required this.homeController,
  });

  final ScrollController scrollController;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center ,
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    "🚀 Experienced Flutter Developer Ready to Bring Your Ideas to Life! 🚀",
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const Divider(),
                                ...List.generate(
                                  about.length, 
                                  (index) => Padding(
                                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .025),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          about[index]["label"],
                                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          about[index]["data"],
                                          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                            fontSize: 14,
                                            color: Colors.white60
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const CustomSpacing(height: .05),
                              ],
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
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
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
                                      BoxShadow(
                                        color: Colors.grey.shade700,
                                        offset: const Offset(-6, -6),
                                        blurRadius: 14,
                                      ),
                                      const BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(6, 6),
                                        blurRadius: 19,
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
                                SizedBox(height: MediaQuery.of(context).size.height * .03),
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
                                    SizedBox(height: MediaQuery.of(context).size.height * .01),
                                    AnimatedTextKit(
                                      totalRepeatCount: 1,
                                      animatedTexts: [
                                        TypewriterAnimatedText(
                                          "Freelanced from Nairobi, Kenya. Proficient in Dart language, Flutter Framework, PHP and LARAVEL, beginner in Arduino Programming.",
                                          textStyle: Theme.of(context).textTheme.displaySmall,
                                          speed: const Duration(milliseconds: 50),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).scaffoldBackgroundColor,
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(-5, -5),
                                            color: Colors.grey.shade900,
                                            blurRadius: 10,
                                          ),
                                          const BoxShadow(
                                            offset: Offset(5, 5),
                                            color: Colors.black,
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
                                                              SlideEffect(
                                                                begin: const Offset(20, 0),
                                                                end: const Offset(0, 0),
                                                                delay: Duration(seconds: (index + 1)),
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
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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