import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/views/home/home_controller.dart';
import 'package:portfolio/app/widgets/spacing.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:portfolio/utils/colors.dart';

class AboutLargeScreen extends StatelessWidget {
  const AboutLargeScreen({
    super.key,
    required this.homeController,
    required this.scrollController,
  });

  final HomeController homeController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8
              ),
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
                          homeController.colors[homeController.selected.value] = KColors.blue;
                          homeController.scrollToSection(homeController.selected.value);
                        },
                        child: Padding( 
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.015,
                            // vertical: 6,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: homeController.selected.value == index ? MainAxisAlignment.end : MainAxisAlignment.start,
                            children: [
                              Text(
                                homeController.navigation[index]["label"],
                                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: homeController.selected.value == index ? KColors.blue : KColors.textColor,
                                  fontWeight: homeController.selected.value == index ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                              Visibility(
                                visible: homeController.selected.value == index,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 5),
                                    Container(
                                      width: 35,
                                      height: 2,
                                      color: KColors.lightTextColor,
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
            const CustomSpacing(height: .05),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: KColors.backGroundGrey,
                boxShadow: [
                  BoxShadow(
                    color: KColors.containerUpperShadowColor,
                    offset: const Offset(-6, -6),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: KColors.containerLowerShadowColor,
                    offset: const Offset(6, 6),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * (!ResponsiveWidgetScreen.isMediumScreen(context) ? 0.6 : .5),
                  height: MediaQuery.of(context).size.height * (!ResponsiveWidgetScreen.isMediumScreen(context) ? 0.7 : .6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: KColors.backGroundGrey,
                    image: const DecorationImage(
                      image: AssetImage("assets/launcher/file.png"),
                    )
                  ),
                ),
              ),
            ).animate(
              effects: [
                const FadeEffect(
                  begin: 0,
                  end: 1,
                  delay: Duration(seconds: 1),
                  duration: Duration(seconds: 2),
                  curve: Curves.bounceOut
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Titus Kariuki Kinyanjui",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: KColors.darkTextColor,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .01),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Freelanced from Nairobi, Kenya. Proficient in Dart language, Flutter Framework, PHP and LARAVEL, beginner in Arduino Programming.",
                        textStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: KColors.lightDarkTextColor,
                        ),
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}