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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.55,
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
          ),
          const CustomSpacing(height: .06),
          Padding(
            padding: const EdgeInsets.only(
              top: 12.0,
              left: 12.0,
            ),
            child: Text(
              "Titus Kariuki",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: KColors.darkTextColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              top: 12
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .58,
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Former student at Karatina University- Nyeri, Kenya. Proficient in Dart language, Flutter Framework, PHP and LARAVEL and Arduino Programming.",
                    textStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 12,
                      color: KColors.lightDarkTextColor,
                    ),
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}