import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/Constant/controller.dart';
import 'package:portfolio_website/Constant/custom_divider.dart';
import 'package:portfolio_website/Constant/custom_spacing.dart';
import 'package:portfolio_website/Constant/custom_text.dart';
import 'package:portfolio_website/Data/launch_url.dart';
import 'package:portfolio_website/Responsive/responsive.dart';

class HandOnContainer extends StatelessWidget {
  HandOnContainer({super.key});

  final controller = Get.find<HandsOnController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.01,
        vertical: MediaQuery.of(context).size.height  * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Center(
              child: CustomText(
                text: "Example of an Impromptu Details Design",
                fontSize: 25,
                color: Colors.blueGrey[300],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: !ResponsiveWidgetScreen.isLargeScreen(context) ? MediaQuery.of(context).size.height * 0.5 : MediaQuery.of(context).size.height * 0.65,
              maxHeight: !ResponsiveWidgetScreen.isLargeScreen(context) ? MediaQuery.of(context).size.height * 0.5 : MediaQuery.of(context).size.height * 0.65,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: ResponsiveWidgetScreen.isLargeScreen(context) ?  2 : ResponsiveWidgetScreen.isMediumScreen(context) ? 2 : 1,
                  child: Container(
                    decoration: BoxDecoration(
                     color: Colors.blueGrey[100],
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(12),
                      ),
                      image: const DecorationImage(
                        image: AssetImage("assets/demo/resume.png"),
                        scale: .2,
                        opacity: .6,
                      )
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.025,
                          ),
                          child: Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ...List.generate(
                                      4, 
                                      (index) => Animate(
                                        // autoPlay: index == controller.onDisplay.value,
                                        effects: const [
                                          FadeEffect(),
                                          FlipEffect(),
                                        ],
                                        child: Tooltip(
                                          message: "View ${controller.data[index]}",
                                          triggerMode: TooltipTriggerMode.tap,
                                          onTriggered: (){
                                            controller.onDisplay.value = index;
                                          },
                                          child: CustomText(
                                            text: controller.data[index],
                                            fontSize: index == controller.onDisplay.value && ResponsiveWidgetScreen.isSmallScreen(context) ? 14 : controller.onDisplay.value == index ? 18 : ResponsiveWidgetScreen.isSmallScreen(context) ? 12 : 15,
                                            color: index == controller.onDisplay.value ? Colors.blueGrey : Colors.grey[300],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                controller.onDisplay.value == 0 ? Obx(
                                  () => Row(
                                    children: [
                                      Expanded(
                                        flex: 1, 
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onHover: (val){
                                              controller.ghhovering.value = val;
                                            },
                                            onTap: (){
                                              navigateTo("https://github.com/CodeK254");
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: ResponsiveWidgetScreen.isLargeScreen(context) ? MediaQuery.of(context).size.height * 0.25 : 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: Colors.white,
                                                    image: const DecorationImage(
                                                      image: AssetImage("assets/demo/github.png")
                                                    ),
                                                    boxShadow:  [
                                                      BoxShadow(
                                                        offset: !controller.ghhovering.value ? const Offset(4, 5) : const Offset(6, 10),
                                                        blurRadius: 3,
                                                        color: Colors.blueGrey.shade100,
                                                      ),
                                                      BoxShadow(
                                                        offset: !controller.ghhovering.value ? const Offset(-3, -3) : const Offset(-5, -6),
                                                        blurRadius: 3,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                CustomText(
                                                  text: "GitHub",
                                                  fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 14 : 18,
                                                  color: controller.ghhovering.value ? Colors.blueGrey[900] : Colors.grey[300],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1, 
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onHover: (val){
                                              controller.fbhovering.value = val;
                                            },
                                            onTap: (){
                                              navigateTo("https://www.facebook.com/titomc.junky");
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: ResponsiveWidgetScreen.isLargeScreen(context) ? MediaQuery.of(context).size.height * 0.25 : 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: Colors.white,
                                                    image: const DecorationImage(
                                                      image: AssetImage("assets/demo/fb.png")
                                                    ),
                                                    boxShadow:  [
                                                      BoxShadow(
                                                        offset: !controller.fbhovering.value ? const Offset(4, 5) : const Offset(6, 10),
                                                        blurRadius: 3,
                                                        color: Colors.blueGrey.shade100,
                                                      ),
                                                      BoxShadow(
                                                        offset: !controller.fbhovering.value ? const Offset(-3, -3) : const Offset(-5, -6),
                                                        blurRadius: 3,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                CustomText(
                                                  text: "Facebook",
                                                  fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 14 : 18,
                                                  color: controller.fbhovering.value ? Colors.blueGrey[900] : Colors.grey[300],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1, 
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onHover: (val){
                                              controller.ighovering.value = val;
                                            },
                                            onTap: (){
                                              navigateTo("https://www.instagram.com/it_is_me_titus/");
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: ResponsiveWidgetScreen.isLargeScreen(context) ? MediaQuery.of(context).size.height * 0.25 : 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: Colors.grey[100],
                                                    image: const DecorationImage(
                                                      image: AssetImage("assets/demo/ig.png")
                                                    ),
                                                    boxShadow:  [
                                                      BoxShadow(
                                                        offset: !controller.ighovering.value ? const Offset(4, 5) : const Offset(6, 10),
                                                        blurRadius: 3,
                                                        color: Colors.blueGrey.shade100,
                                                      ),
                                                      BoxShadow(
                                                        offset: !controller.ighovering.value ? const Offset(-3, -3) : const Offset(-5, -6),
                                                        blurRadius: 3,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                CustomText(
                                                  text: "Instagram",
                                                  fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 14 : 18,
                                                  color: controller.ighovering.value ? Colors.blueGrey[900] : Colors.grey[300],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                  ),
                                )
                                : controller.onDisplay.value == 1 ?
                                Obx(
                                  () => Row(
                                    children: [
                                      Expanded(
                                        flex: 1, 
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onHover: (val){
                                              controller.kahovering.value = val;
                                            },
                                            onTap: (){
                                              navigateTo("https://www.google.com/search?q=kasarani+primary+school&rlz=1C1GCEU_enKE1058KE1058&oq=kasarani+pr&aqs=chrome.0.0i355i512j46i175i199i512j69i64j0i512j69i57j0i512l2j0i22i30.85748j0j4&sourceid=chrome&ie=UTF-8#lpg=cid:CgIgAQ%3D%3D,ik:CAoSLEFGMVFpcE5fZ1Vxb3VNeHJ5SGZ3cDI2RUJzZnVZYnhvcGFLaUdWZGNCSkJl");
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: ResponsiveWidgetScreen.isLargeScreen(context) ? MediaQuery.of(context).size.height * 0.25 : 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: Colors.white,
                                                    image: const DecorationImage(
                                                      image: AssetImage("assets/demo/kasa.jpg"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    boxShadow:  [
                                                      BoxShadow(
                                                        offset: !controller.kahovering.value ? const Offset(4, 5) : const Offset(6, 10),
                                                        blurRadius: 3,
                                                        color: Colors.blueGrey.shade100,
                                                      ),
                                                      BoxShadow(
                                                        offset: !controller.kahovering.value ? const Offset(-3, -3) : const Offset(-5, -6),
                                                        blurRadius: 3,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                CustomText(
                                                  text: "Kasarani Primary",
                                                  fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 14 : 18,
                                                  color: controller.kahovering.value ? Colors.blueGrey[900] : Colors.grey[300],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1, 
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onHover: (val){
                                              controller.ruhovering.value = val;
                                            },
                                            onTap: (){
                                              navigateTo("https://www.google.com/maps/search/Middle+school/@-0.3954167,37.6713857,13z/data=!3m1!4b1?entry=ttu");
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: ResponsiveWidgetScreen.isLargeScreen(context) ? MediaQuery.of(context).size.height * 0.25 : 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: Colors.white,
                                                    image: const DecorationImage(
                                                      image: AssetImage("assets/demo/ruby.jpg"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    boxShadow:  [
                                                      BoxShadow(
                                                        offset: !controller.ruhovering.value ? const Offset(4, 5) : const Offset(6, 10),
                                                        blurRadius: 3,
                                                        color: Colors.blueGrey.shade100,
                                                      ),
                                                      BoxShadow(
                                                        offset: !controller.ruhovering.value ? const Offset(-3, -3) : const Offset(-5, -6),
                                                        blurRadius: 3,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                CustomText(
                                                  text: "Rubate Secondary",
                                                  fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 14 : 18,
                                                  color: controller.ruhovering.value ? Colors.blueGrey[900] : Colors.grey[300],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1, 
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onHover: (val){
                                              controller.kuhovering.value = val;
                                            },
                                            onTap: (){
                                              navigateTo("https://karu.ac.ke/");
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: ResponsiveWidgetScreen.isLargeScreen(context) ? MediaQuery.of(context).size.height * 0.25 : 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: Colors.grey[100],
                                                    image: const DecorationImage(
                                                      image: AssetImage("assets/demo/karu.jpg"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    boxShadow:  [
                                                      BoxShadow(
                                                        offset: !controller.kuhovering.value ? const Offset(4, 5) : const Offset(6, 10),
                                                        blurRadius: 3,
                                                        color: Colors.blueGrey.shade100,
                                                      ),
                                                      BoxShadow(
                                                        offset: !controller.kuhovering.value ? const Offset(-3, -3) : const Offset(-5, -6),
                                                        blurRadius: 3,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                CustomText(
                                                  text: "Karatina University",
                                                  fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 14 : 18,
                                                  color: controller.kuhovering.value ? Colors.blueGrey[900] : Colors.grey[300],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                  ),
                                )
                                :
                                Container(),
                                const CustomVerticalSpacing(height: 0.01),
                                CustomDivider(screenSize: MediaQuery.of(context).size.width),
                                const CustomVerticalSpacing(height: 0.01),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: controller.onDisplay.value == 0 ? Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage("assets/logo_two.jpg"),
                                            radius: MediaQuery.of(context).size.height * 0.1,
                                          ),
                                          Positioned(
                                            top: 4,
                                            right: 8,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Icon(
                                                  Icons.verified,
                                                  size: 30,
                                                  color: Colors.blue[600],
                                                ),
                                              ),
                                            )
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Center(
                                            child: CustomText(
                                              text: "Contact",
                                              fontSize: ResponsiveWidgetScreen.isLargeScreen(context) || ResponsiveWidgetScreen.isMediumScreen(context) ? MediaQuery.of(context).size.width * 0.018 : 18,
                                              color: Colors.blueGrey[900],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          CustomText(
                                            text: "Titus Kariuki Kinyanjui,",
                                            fontSize: ResponsiveWidgetScreen.isLargeScreen(context) || ResponsiveWidgetScreen.isMediumScreen(context) ? MediaQuery.of(context).size.width * 0.014 : 16,
                                            color: Colors.blueGrey,
                                          ),
                                          SizedBox(height: 6),
                                          CustomText(
                                            text: "+254 742143102.",
                                            fontSize: ResponsiveWidgetScreen.isLargeScreen(context) || ResponsiveWidgetScreen.isMediumScreen(context) ? MediaQuery.of(context).size.width * 0.012 : 14,
                                            color: Colors.blueGrey,
                                          ),
                                          SizedBox(height: 6),
                                          CustomText(
                                            text: "titohkaris254@gmail.com,",
                                            fontSize: ResponsiveWidgetScreen.isLargeScreen(context) || ResponsiveWidgetScreen.isMediumScreen(context) ? MediaQuery.of(context).size.width * 0.012 : 14,
                                            color: Colors.blueGrey,
                                          ),
                                          SizedBox(height: 6),
                                          CustomText(
                                            text: "https://github.com/CodeK254.",
                                            fontSize: ResponsiveWidgetScreen.isLargeScreen(context) || ResponsiveWidgetScreen.isMediumScreen(context) ? MediaQuery.of(context).size.width * 0.012 : 14,
                                            color: Colors.blueGrey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ) : 
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const CustomVerticalSpacing(height: 0.01),
                                      CustomText(
                                        text: "31440 - 00100",
                                        fontSize: MediaQuery.of(context).size.width * 0.012,
                                        color: Colors.brown[900],
                                      ),
                                      const CustomVerticalSpacing(height: 0.015),
                                      CustomText(
                                        text: "Student at Karatina University",
                                        fontSize: MediaQuery.of(context).size.width * 0.012,
                                        color: Colors.brown[900],
                                      ),
                                      const CustomVerticalSpacing(height: 0.015),
                                      CustomText(
                                        text: "Nairobi, Kenya.",
                                        fontSize: MediaQuery.of(context).size.width * 0.012,
                                        color: Colors.brown[900],
                                      ),
                                      const CustomVerticalSpacing(height: 0.015),
                                    ],
                                  ),
                                ),
                              ],
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
    );
  }
}