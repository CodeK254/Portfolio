import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/views/contact/contact_controller.dart';
import 'package:portfolio/app/widgets/spacing.dart';
import 'package:portfolio/app/widgets/text.dart';

class ContactLargeScreen extends StatelessWidget {
  ContactLargeScreen({super.key});

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: "Contact Me", 
                        fontSize: 30, 
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      const CustomSpacing(height: .01),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .05,
                            child: Divider(color: Colors.grey.shade300, thickness: 3),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .15,
                            child: Divider(color: Colors.green.shade200, thickness: 1.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const CustomSpacing(height: .1),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 4,
                    ),
                    itemCount: 4, 
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: InkWell(
                          onTap: (){
                            
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
                  const CustomSpacing(height: .1),
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