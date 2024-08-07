import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/views/home/services_controller.dart';
import 'package:portfolio/app/widgets/spacing.dart';
import 'package:portfolio/app/widgets/text_style.dart';
import 'package:portfolio/app/widgets/title.dart';
import 'package:portfolio/utils/colors.dart';

class ServicesSmallScreen extends StatelessWidget {
  ServicesSmallScreen({super.key, required this.pageKey});
  final ServicesController servicesController = Get.put(ServicesController());
  final GlobalKey pageKey;

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: pageKey,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const CustomLabel(label: "Services Offered"),
                  ),
                  const CustomSpacing(height: .1),
                  Obx(
                    () => Container(
                      decoration: BoxDecoration(
                        color: KColors.backGroundGrey,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(-3, -3),
                            color: KColors.containerUpperShadowColor,
                            blurRadius: 4,
                          ),
                          BoxShadow(
                            offset: const Offset(3, 3),
                            color: KColors.containerLowerShadowColor,
                            blurRadius: 7,
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.timer,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              servicesController.time.toString(),
                              style: GoogleFonts.ubuntu(
                                fontSize: 16,
                                color: KColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animate(
                      autoPlay: true,
                      effects: [
                        const SlideEffect(
                          begin: Offset(0, -2),
                          end: Offset(0, 0),
                          duration: Duration(milliseconds: 300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const CustomSpacing(height: .03),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: servicesController.services.length,
                itemBuilder: (context, index){
                  return InkWell(
                    hoverColor: Colors.green,
                    onTap: (){
                      servicesController.resetColors();
                      servicesController.tileColor[index].value = KColors.blue.withOpacity(.2);
                    },
                    // onHover: (value) {
                    //   if(value){
                    //     servicesController.resetColors();
                    //     servicesController.tileColor[index].value = Colors.green;
                    //   } else {
                    //     servicesController.resetColors();
                    //   }
                    // },
                    onLongPress: (){
                      servicesController.resetColors();
                      servicesController.tileColor[index].value = KColors.blue.withOpacity(.2);
                    },
                    child: Obx(
                      () => Container(
                        color: servicesController.tileColor[index].value,
                        child: Stack(
                          children: [
                            Center(
                              child: Opacity(
                                opacity: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      servicesController.services[index]["icon"],
                                      size: 65,
                                      color: servicesController.services[index]["color"],
                                    ),
                                    const CustomSpacing(height: .02),
                                    Text(
                                      servicesController.services[index]["label"],
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 25,
                                        color: KColors.darkTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Visibility(
                                visible: servicesController.tileColor[index].value == KColors.blue.withOpacity(.2),
                                child: Container(
                                  color: Colors.grey.shade900,
                                  width: MediaQuery.of(context).size.width * .48,
                                  height: MediaQuery.of(context).size.height * .25,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        servicesController.services[index]["description"],
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 12,
                                          color: KColors.textColor,
                                          fontWeight: FontWeight.normal,
                                          // overflow: TextOverflow.ellipsis
                                        ),
                                        maxLines: 20,
                                      ),
                                    ),
                                  ),
                                ).animate(
                                  effects: [
                                    const SlideEffect(
                                      begin: Offset(0, 1),
                                      end: Offset(0, 0),
                                      duration: Duration(seconds: 5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomServicesDisplay extends StatelessWidget {
  final String label;
  final List<Map> data;
  const CustomServicesDisplay({
    super.key, required this.label, required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            label,
            style: tStyle(23, 1, Colors.blueGrey.shade800),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      10, 
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.grey.shade500,
                          height: MediaQuery.of(context).size.height * 0.65,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: const Image(
                            image: AssetImage("assets/images/eight.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}