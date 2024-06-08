import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';  
import 'package:portfolio/app/views/home/home_controller.dart';
import 'package:portfolio/app/widgets/spacing.dart';
import 'package:portfolio/utils/colors.dart';

class AboutSmallScreen extends StatelessWidget {
  const AboutSmallScreen({
    super.key,
    required this.homeController, required this.scrollController,
  });

  final HomeController homeController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.75,
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
            const CustomSpacing(height: .03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Titus Kariuki",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: KColors.darkTextColor,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .58,
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Student at Karatina University- Nyeri, Kenya. Proficient in Dart language, Flutter Framework, PHP and LARAVEL, beginner in Arduino Programming.",
                        textStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 12,
                          color: KColors.lightDarkTextColor,
                        ),
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}