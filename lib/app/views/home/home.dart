import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/Responsive/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mobile Developer",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              CupertinoIcons.search,
              size: 22,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              CupertinoIcons.settings,
              size: 22,
            ),
          ),
        ],
      ),
      body: ResponsiveWidgetScreen(
        largeScreen: Container(
          color: Colors.red,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        mediumScreen: Container(
          color: Colors.green,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        smallScreen: Stack(
          children: [
            Image(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.9,
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ).animate(
              effects: [
                FadeEffect(
                  begin: 0.0,
                  end: .3,
                  duration: const Duration(seconds: 3),
                  delay: const Duration(seconds: 2),
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
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-3, -3),
                              blurRadius: 14,
                            ),
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(3, 3),
                              blurRadius: 14,
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage("assets/launcher/file.png"),
                          )
                        ),
                      ).animate(
                        effects: [
                          SlideEffect(
                            begin: Offset(0, -10),
                            end: Offset(0, 0),
                            delay: const Duration(seconds: 1),
                            duration: const Duration(seconds: 1),
                            curve: Curves.bounceOut
                          ),
                        ],
                      ),
                      SizedBox(width: 12),
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
                            SizedBox(height: 8),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}