import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:percent_indicator/percent_indicator.dart";
import "package:portfolio/app/data/dummy.dart";
import "package:portfolio/app/views/home/resume_controller.dart";
import "package:portfolio/app/widgets/spacing.dart";
import "package:portfolio/app/widgets/text.dart";
import "package:portfolio/app/widgets/title.dart";
import "package:portfolio/responsive/responsive.dart";
import "package:portfolio/utils/colors.dart";
import 'dart:js' as js;

class ResumeLargeScreen extends StatelessWidget {
  ResumeLargeScreen({super.key, required this.pageKey});

  final ResumeController resumeController = Get.put(ResumeController());
  final GlobalKey pageKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: pageKey,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomLabel(label: "My Resume"),
              ),
              GestureDetector(
                onTap: (){
                  js.context.callMethod('open', ['https://drive.google.com/file/d/1OtGVewKrTZgAUHQ9vqi7DS5ecK6KrWDm/view?usp=sharing']);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: KColors.backGroundGrey,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(-5, -5),
                        color: KColors.containerUpperShadowColor,
                        blurRadius: 16,
                      ),
                      BoxShadow(
                        offset: const Offset(5, 5),
                        color: KColors.containerLowerShadowColor,
                        blurRadius: 16,
                      ),
                    ]
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text(
                          "My Resume",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.download,
                          size: 25,
                          color: Colors.redAccent,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const CustomSpacing(height: .1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Obx(
                  () => Stepper(
                    physics: const ClampingScrollPhysics(),
                    controlsBuilder: (context, details) {
                      return Container();
                    },
                    currentStep: resumeController.leftStepperSelected.value,
                    onStepContinue: (){
                      if(resumeController.leftStepperSelected.value == 0){
                        resumeController.leftStepperSelected.value += 1;
                      } else {
                        resumeController.leftStepperSelected.value -= 1;
                      }
                    },
                    steps: [
                      ...List.generate(
                        resumeController.resumeInfo.length, 
                        (index) => resumeSteps(
                          resumeController.resumeInfo[index]["title"],
                          resumeController.resumeInfo[index]["subtitle"],
                          resumeController.resumeInfo[index]["description"],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const CustomSpacing(width: .025),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: "Work Experience", 
                      fontSize: 25, 
                      textColor: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                    ...List.generate(
                      resumeController.workExperience.length, 
                      (index) => Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.025,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "${(index + 1)}.",
                                  fontSize: 18, 
                                  textColor: KColors.lightDarkTextColor,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: CustomText(
                                    text: "${resumeController.workExperience[index]["subtitle"]}",
                                    fontSize: 18, 
                                    textColor: KColors.lightDarkTextColor,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            ...List.generate(
                              resumeController.workExperience[index]["description"].length, 
                              (indexTwo) => Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  color: KColors.backGroundGrey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomText(
                                      text: resumeController.workExperience[index]["description"][indexTwo], 
                                      fontSize: 14, 
                                      textColor: KColors.lightDarkTextColor,
                                      centerText: false,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomLabel(label: "Solo-Projects"),
          ),
          ...List.generate(
            soloProjects.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSpacing(height: .075),
                  CustomText(
                    text: soloProjects[index]["title"].toString(),
                    fontSize: 22, 
                    textColor: Colors.blueGrey.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                  const CustomSpacing(height: .02),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...List.generate(
                          soloProjects[index]["images"].length,
                          (indexTwo) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image(
                              image: AssetImage("assets/apps/${soloProjects[index]["folder"]}/${soloProjects[index]["images"][indexTwo]}.png"),
                              width: MediaQuery.of(context).size.width * .3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomSpacing(height: .025),
                ],
              ),
            ),
          ),
          const CustomSpacing(height: .1),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomLabel(label: "Proficiency"),
          ),
          const CustomSpacing(height: .075),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .02,
              vertical: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularPercentIndicator(
                  lineWidth: 12,
                  percent: 1,
                  progressColor: KColors.amber,
                  arcBackgroundColor: KColors.backGroundGrey,
                  arcType: ArcType.FULL_REVERSED,
                  radius:  MediaQuery.of(context).size.width * (!ResponsiveWidgetScreen.isMediumScreen(context) ? .2 : .22),
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Tech Stack", 
                        fontSize: 18, 
                        textColor: KColors.darkTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const CustomSpacing(height: .01),
                      Container(
                        width: MediaQuery.of(context).size.width * .2,
                        height: 1.5,
                        color: KColors.lightTextColor,
                      ),
                      const CustomSpacing(height: .01),
                      ...List.generate(
                        resumeController.techStack.length, 
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: CustomText(
                            text: resumeController.techStack[index], 
                            fontSize: !ResponsiveWidgetScreen.isMediumScreen(context) ? 16 : 14, 
                            textColor: KColors.darkTextColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const CustomSpacing(width: .12),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: resumeController.learning.length, 
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .13,
                          decoration: BoxDecoration(
                            color: KColors.backGroundGrey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: resumeController.learning[index]["language"].toString(), 
                                      fontSize: 20, 
                                      textColor: Colors.blueGrey.shade400,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const CustomSpacing(width: .02),
                                    CustomText(
                                      text: "${resumeController.learning[index]["percentage"]}%", 
                                      fontSize: 16, 
                                      textColor: Colors.white60,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                                const CustomSpacing(height: .025),
                                LinearPercentIndicator(
                                  percent: resumeController.learning[index]["percentage"] / 100,
                                  animation: true,
                                  backgroundColor: KColors.backGroundGrey,
                                  fillColor: Colors.blueGrey.shade300,
                                  progressColor: resumeController.learning[index]["color"],
                                ),
                              ],
                            ),
                          ),
                        )
                        .animate(
                          effects: [
                            FadeEffect(
                              begin: 0,
                              end: 1,
                              duration: const Duration(milliseconds: 500),
                              delay: Duration(milliseconds: 500 * index),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Step resumeSteps(String title, String subtitle, List<String> data) {
    return Step(
      // isActive: true,
      label: const Icon(
        FontAwesomeIcons.book,
        size: 25,
        color: Colors.white,
      ),
      title: CustomText(
        text: title, 
        fontSize: 25, 
        textColor: Colors.green,
        fontWeight: FontWeight.bold,
      ),
      subtitle: Column(
        children: [
          ...List.generate(
            data.length, 
            (index) => CustomText(
              text: "\n${data[index]}",
              fontSize: 14, 
              textColor: KColors.lightDarkTextColor,
            ),
          ),
        ],
      ),
      content: Container(),
    );
  }
}