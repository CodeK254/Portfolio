import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:percent_indicator/percent_indicator.dart";
import "package:portfolio/app/views/home/resume_controller.dart";
import "package:portfolio/app/widgets/spacing.dart";
import "package:portfolio/app/widgets/text.dart";
import "package:portfolio/app/widgets/title.dart";

class ResumeSmallScreen extends StatelessWidget {
  ResumeSmallScreen({super.key});

  final ResumeController resumeController = Get.put(ResumeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
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
                                          textColor: Colors.white,
                                          fontStyle: FontStyle.italic,
                                        ),
                                        const SizedBox(width: 10),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * .7,
                                          child: CustomText(
                                            text: "${resumeController.workExperience[index]["subtitle"]}",
                                            fontSize: 18, 
                                            textColor: Colors.white,
                                            fontStyle: FontStyle.italic,
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
                                              textColor: Colors.grey.shade300,
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
                  const CustomLabel(label: "Proficiency"),
                  const CustomSpacing(height: .075),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .05,
                      vertical: 12,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: resumeController.resumeInfo.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .12,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade900,
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
                                      const CustomSpacing(width: .03),
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
                                    backgroundColor: Colors.white,
                                    fillColor: Colors.blueGrey.shade300,
                                    progressColor: Colors.green.shade700,
                                  ),
                                ],
                              ),
                            ),
                          )
                          .animate(
                            effects: [
                              SlideEffect(
                                begin: const Offset(-10, 0),
                                end: const Offset(0, 0),
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
              ),
            ),
          ],
        ),
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
              textColor: Colors.grey.shade100,
            ),
          ),
        ],
      ),
      content: Container(),
    );
  }
}