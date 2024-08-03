import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/views/home/services_controller.dart';
import 'package:portfolio/app/widgets/spacing.dart';
import 'package:portfolio/app/widgets/text_style.dart';
import 'package:portfolio/app/widgets/title.dart';
import 'package:portfolio/utils/colors.dart';

class ServicesLargeScreen extends StatelessWidget {
  ServicesLargeScreen({super.key});
  final ServicesController servicesController = Get.put(ServicesController());

  @override
  Widget build(BuildContext context) {
    return Column(
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
                const CustomLabel(label: "Services Offered"),
                const CustomSpacing(height: .1),
                  Obx(
                    () => Container(
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
                                color: Colors.grey.shade300,
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
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: servicesController.services.length,
                itemBuilder: (context, index){
                  return InkWell(
                    hoverColor: KColors.blue.withOpacity(.4),
                    onTap: (){

                    },
                    onHover: (value) {
                      if(value){
                        servicesController.resetColors();
                        servicesController.tileColor[index].value = KColors.blue.withOpacity(.4);
                      } else {
                        servicesController.resetColors();
                      }
                    },
                    child: Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          color: servicesController.tileColor[index].value,
                          borderRadius: BorderRadius.circular(12),
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
                                      color: KColors.black
                                    ),
                                    const CustomSpacing(height: .02),
                                    Text(
                                      servicesController.services[index]["label"],
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 25,
                                        color: KColors.lightDarkTextColor,
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
                                visible: servicesController.tileColor[index].value == KColors.blue.withOpacity(.4),
                                child: Container(
                                  color: KColors.lightDarkTextColor,
                                  width: MediaQuery.of(context).size.width * .32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      servicesController.services[index]["description"],
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 14,
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.normal,
                                        // overflow: TextOverflow.ellipsis
                                      ),
                                      maxLines: 20,
                                    ),
                                  ),
                                ).animate(
                                  effects: [
                                    const FadeEffect(
                                      begin: 0,
                                      end: 1,
                                      duration: Duration(seconds: 1),
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
                            image: CachedNetworkImageProvider("assets/images/eight.png"),
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