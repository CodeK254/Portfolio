import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/views/home/testimonial_controller.dart';
import 'package:portfolio/app/widgets/spacing.dart';
import 'package:portfolio/app/widgets/text.dart';
import 'package:portfolio/app/widgets/title.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:portfolio/utils/colors.dart';

class TestimonialMediumScreen extends StatelessWidget {
  TestimonialMediumScreen({super.key, required this.pageKey});
  final TestimonialController testimonialController = Get.put(TestimonialController());
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
          const CustomLabel(label: "Testimonials"),
          const CustomSpacing(height: .06),
          ...List.generate(
            testimonialController.testimonials.length, 
            (index) => CustomTestimonialColumn(
              title: testimonialController.testimonials[index]["title"],
              data: testimonialController.testimonials[index]["data"],
              image: testimonialController.testimonials[index]["image"],
              selected: testimonialController.testimonials[index]["selected"],
            )
          ),
        ],
      ),
    );
  }
}

class CustomTestimonialColumn extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final String title;
  final List<String> image;
  final RxInt selected;
  const CustomTestimonialColumn({
    super.key, required this.data, required this.title, required this.image, required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * .075,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title, 
            fontSize: 20, 
            textColor: KColors.lightDarkTextColor,
            fontWeight: FontWeight.bold,
          ),
          const Divider(endIndent: 20),
          const CustomSpacing(height: .03),
          ResponsiveWidgetScreen.isLargeScreen(context) ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 2,
                      color: KColors.lightTextColor
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                          data.length, 
                          (index) => CustomTestimonialDisplay(
                            label: data[index]["label"],
                            value: data[index]["value"],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const CustomSpacing(width: .05),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 2 / 1,
                      child: CarouselSlider(
                        items: [
                          ...List.generate(
                            image.length, 
                            (index) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Image(
                                image: AssetImage(image[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          aspectRatio: 2 / 1,
                          onPageChanged: (index, reason) => selected.value = index,
                        ),
                      ),
                    ).animate(
                      effects: [
                        const FadeEffect(
                          begin: 0,
                          end: 1,
                          delay: Duration(milliseconds: 500),
                          duration: Duration(milliseconds: 2),
                        )
                      ]
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            image.length, 
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 12,
                              ),
                              child: CircleAvatar(
                                radius: selected.value == index ? 5 : 3,
                                backgroundColor: selected.value == index ? Colors.redAccent : Colors.grey,
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
          ) : ResponsiveWidgetScreen.isMediumScreen(context) ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 2,
                      color: KColors.lightTextColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                          data.length, 
                          (index) => CustomTestimonialDisplay(
                            label: data[index]["label"],
                            value: data[index]["value"],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const CustomSpacing(width: .05),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 2 / 1,
                      child: CarouselSlider(
                        items: [
                          ...List.generate(
                            image.length, 
                            (index) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Image(
                                image: AssetImage(image[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          aspectRatio: 2 / 1,
                          onPageChanged: (index, reason) => selected.value = index,
                        ),
                      ),
                    ).animate(
                      effects: [
                        const FadeEffect(
                          begin: 0,
                          end: 1,
                          delay: Duration(milliseconds: 500),
                          duration: Duration(milliseconds: 2),
                        ),
                      ],
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            image.length, 
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 12,
                              ),
                              child: CircleAvatar(
                                radius: selected.value == index ? 5 : 3,
                                backgroundColor: selected.value == index ? Colors.redAccent : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ) : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  AspectRatio(
                    aspectRatio: 2 / 1,
                    child: CarouselSlider(
                      items: [
                        ...List.generate(
                          image.length, 
                          (index) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Image(
                              image: AssetImage(image[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        aspectRatio: 2 / 1,
                        onPageChanged: (index, reason) => selected.value = index,
                      ),
                    ),
                  ).animate(
                    effects: [
                      const FadeEffect(
                        begin: 0,
                        end: 1,
                        delay: Duration(milliseconds: 500),
                        duration: Duration(milliseconds: 2),
                      ),
                    ],
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          image.length, 
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 12,
                            ),
                            child: CircleAvatar(
                              radius: selected.value == index ? 5 : 3,
                              backgroundColor: selected.value == index ? Colors.redAccent : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const CustomSpacing(height: .02),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 2,
                    color: KColors.lightTextColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        data.length,
                        (index) => CustomTestimonialDisplay(
                          label: data[index]["label"],
                          value: data[index]["value"],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .1,
                ),
                child: Divider(
                  thickness: .3,
                  color: Colors.grey.shade300,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTestimonialDisplay extends StatelessWidget {
  final String label;
  final String value;
  const CustomTestimonialDisplay({
    super.key, required this.label, required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ResponsiveWidgetScreen.isLargeScreen(context) ? Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: label, 
            fontSize: 16, 
            textColor: KColors.darkTextColor,
            fontWeight: FontWeight.bold,
          ),
          const CustomSpacing(width: .012),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .215,
              minWidth: MediaQuery.of(context).size.width * .2,
            ),
            child: CustomText(
              text: value,
              fontSize: 16,
              textColor: KColors.lightDarkTextColor
            ),
          ),
        ],
      ) : ResponsiveWidgetScreen.isMediumScreen(context) ? Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: label, 
            fontSize: 16, 
            textColor: KColors.lightDarkTextColor,
            fontWeight: FontWeight.bold,
          ),
          const CustomSpacing(width: .012),
          CustomText(
            text: value, 
            fontSize: 16, 
            textColor: KColors.lightDarkTextColor,
          ),
        ],
      ) : Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: label, 
            fontSize: MediaQuery.of(context).size.width > 580 ? 16 : 14, 
            textColor: KColors.darkTextColor,
            fontWeight: FontWeight.bold,
          ),
          const CustomSpacing(width: .012),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: CustomText(
                text: value,
                fontSize: MediaQuery.of(context).size.width > 580 ? 16 : 14,
                textColor: KColors.lightDarkTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}