import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/services/launcher.dart';
import 'package:portfolio/app/views/contact/contact_controller.dart';
import 'package:portfolio/app/widgets/spacing.dart';
import 'package:portfolio/app/widgets/text.dart';
import 'package:portfolio/app/widgets/title.dart';
import 'package:portfolio/responsive/responsive.dart';

class ContactSmallScreen extends StatelessWidget {
  ContactSmallScreen({super.key});

  final ContactController contactController = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const CustomLabel(label: "Contact Me"),
                  const CustomSpacing(height: .1),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .05,
                      vertical: 12,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: MediaQuery.of(context).size.height * .05,
                        crossAxisSpacing: MediaQuery.of(context).size.height * .1,
                        childAspectRatio: ResponsiveWidgetScreen.isLargeScreen(context) ? 4 : ResponsiveWidgetScreen.isMediumScreen(context) ? 3.5 : 4.2,
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
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    contactController.hovered.value == index ? BoxShadow(
                                      offset: const Offset(-3, -3),
                                      color: Colors.grey.shade800,
                                      blurRadius: 6,
                                    ) : BoxShadow(
                                      offset: const Offset(-3, -3),
                                      color: Colors.grey.shade900,
                                      blurRadius: 6,
                                    ),
                                    contactController.hovered.value == index ? const BoxShadow(
                                      offset: Offset(3, 3),
                                      color: Colors.black,
                                      blurRadius: 6,
                                    ): const BoxShadow(
                                      offset: Offset(3, 3),
                                      color: Colors.black,
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
                                            backgroundColor: Colors.grey.shade700,
                                            child: Icon(
                                              contactController.contactInfo[index]["icon"],
                                              color: Colors.green.shade300,
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
                                                fontSize: !ResponsiveWidgetScreen.isSmallScreen(context) ? 20 : 18, 
                                                textColor: Colors.blueGrey.shade400,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              CustomSpacing(height: !ResponsiveWidgetScreen.isSmallScreen(context) ? .012 : .008),
                                              CustomText(
                                                text: contactController.contactInfo[index]["value"], 
                                                fontSize: !ResponsiveWidgetScreen.isSmallScreen(context) ? 15 : 14, 
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
                                  SlideEffect(
                                    begin: const Offset(-10, 0),
                                    end: const Offset(0, 0),
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
                  ResponsiveWidgetScreen.isLargeScreen(context) ? const CustomSpacing(height: .1) : const CustomSpacing(height: .2),
                  const Divider(),
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
          ],
        ),
      ),
    );
  }
}