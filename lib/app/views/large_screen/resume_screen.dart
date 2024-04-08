import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:portfolio/app/views/home/resume_controller.dart";
import "package:portfolio/app/widgets/spacing.dart";
import "package:portfolio/app/widgets/text.dart";
import "package:portfolio/app/widgets/title.dart";

class ResumeLargeScreen extends StatelessWidget {
  ResumeLargeScreen({super.key});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Obx(
                          () => Stepper(
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
                        child: Obx(
                          () => Stepper(
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
      // subtitle: CustomText(
      //   text: subtitle,
      //   fontSize: 20, 
      //   textColor: Colors.green,
      //   fontWeight: FontWeight.bold,
      // ),
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