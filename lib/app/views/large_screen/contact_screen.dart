import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/services/launcher.dart';
import 'package:portfolio/app/views/contact/contact_controller.dart';
import 'package:portfolio/app/widgets/spacing.dart';
import 'package:portfolio/app/widgets/text.dart';
import 'package:portfolio/app/widgets/title.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:portfolio/utils/colors.dart';

class ContactLargeScreen extends StatelessWidget {
  ContactLargeScreen({super.key, required this.pageKey});

  final ContactController contactController = Get.put(ContactController());
  final GlobalKey pageKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: pageKey,
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomLabel(label: "Contact Me"),
          const CustomSpacing(height: .04),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .05,
              vertical: 12,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: MediaQuery.of(context).size.height * .05,
                crossAxisSpacing: MediaQuery.of(context).size.height * .1,
                childAspectRatio: ResponsiveWidgetScreen.isLargeScreen(context) ? 4 : 3.5,
              ),
              itemCount: contactController.contactInfo.length, 
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: InkWell(
                    onTap: (){
                      openUrl(contactController.contactInfo[index]["link"]);
                    },
                    onHover: (value){
                      contactController.hovered.value = index;
                    },
                    child: Obx(
                      () => Container(
                        height: MediaQuery.of(context).size.height * .2,
                        decoration: BoxDecoration(
                          color: KColors.backGroundGrey,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            contactController.hovered.value != index ? BoxShadow(
                              offset: const Offset(-3, -3),
                              color: KColors.containerUpperShadowColor,
                              blurRadius: 6,
                            ) : BoxShadow(
                              offset: const Offset(-3, -3),
                              color: KColors.containerLowerShadowColor,
                              blurRadius: 6,
                            ),
                            contactController.hovered.value != index ? BoxShadow(
                              offset: const Offset(3, 3),
                              color: KColors.backGroundGrey,
                              blurRadius: 6,
                            ): BoxShadow(
                              offset: const Offset(3, 3),
                              color: KColors.backGroundGrey,
                              blurRadius: 6,
                            ),
                          ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white60,
                                    child: Icon(
                                      contactController.contactInfo[index]["icon"],
                                      color: contactController.contactInfo[index]["color"],
                                      size: 25,
                                    ),
                                  ),
                                  const CustomSpacing(width: .03),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: contactController.contactInfo[index]["label"], 
                                        fontSize: 20, 
                                        textColor: Colors.blueGrey.shade400,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const CustomSpacing(height: .012),
                                      CustomText(
                                        text: contactController.contactInfo[index]["value"], 
                                        fontSize: 14, 
                                        textColor: Colors.blueGrey.shade200,
                                      ),
                                    ],
                                  ),
                                ],
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
                            duration: const Duration(seconds: 1),
                            delay: Duration(seconds: 1 * index),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}