import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:percent_indicator/percent_indicator.dart";
import "package:portfolio/app/views/home/resume_controller.dart";
import "package:portfolio/app/widgets/spacing.dart";
import "package:portfolio/app/widgets/text.dart";
import "package:portfolio/app/widgets/title.dart";
import "package:portfolio/utils/colors.dart";

class ResumeSmallScreen extends StatelessWidget {
  ResumeSmallScreen({super.key});

  final ResumeController resumeController = Get.put(ResumeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomLabel(label: "My Resume"),
        const CustomSpacing(height: .1),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
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
            const CustomSpacing(width: .025),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.04,
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomText(
                      text: "Work Experience", 
                      fontSize: 25, 
                      textColor: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
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
                                fontSize: 16, 
                                textColor: KColors.darkTextColor,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .7,
                                child: CustomText(
                                  text: "${resumeController.workExperience[index]["subtitle"]}",
                                  fontSize: 16, 
                                  textColor: KColors.darkTextColor,
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
                                color: Colors.black54,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomText(
                                    text: resumeController.workExperience[index]["description"][indexTwo], 
                                    fontSize: 14, 
                                    textColor: KColors.lightTextColor,
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
              ),
            ),
          ],
        ),
        const CustomSpacing(height: .1),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomLabel(label: "Proficiency"),
        ),
        const CustomSpacing(height: .075),
        Center(
          child: CircularPercentIndicator(
            lineWidth: 12,
            percent: 1,
            progressColor: KColors.amber,
            arcBackgroundColor: KColors.backGroundGrey,
            arcType: ArcType.FULL_REVERSED,
            radius:  MediaQuery.of(context).size.width * .45,
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
                      fontSize: 14,
                      textColor: KColors.darkTextColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const CustomSpacing(height: .05),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05,
            vertical: 12,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: resumeController.learning.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .12,
                  decoration: BoxDecoration(
                    color: KColors.backGroundGrey,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(-3, -3),
                        color: KColors.containerUpperShadowColor,
                        blurRadius: 9,
                      ),
                      BoxShadow(
                        offset: const Offset(3, 3),
                        color: KColors.containerLowerShadowColor,
                        blurRadius: 9,
                      ),
                    ]
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
                              textColor: KColors.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                            const CustomSpacing(width: .03),
                            CustomText(
                              text: "${resumeController.learning[index]["percentage"]}%", 
                              fontSize: 16, 
                              textColor: KColors.textColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                        const CustomSpacing(height: .025),
                        LinearPercentIndicator(
                          percent: resumeController.learning[index]["percentage"] / 100,
                          animation: true,
                          backgroundColor: Colors.white,
                          fillColor: KColors.white,
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
          )
        ),
      ],
    );
  }

  Step resumeSteps(String title, String subtitle, List<String> data) {
    return Step(
      // isActive: true,
      label: Icon(
        FontAwesomeIcons.book,
        size: 25,
        color: KColors.darkTextColor,
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