import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/views/home/testimonial_controller.dart';
import 'package:portfolio/app/widgets/spacing.dart';
import 'package:portfolio/app/widgets/text.dart';
import 'package:portfolio/responsive/responsive.dart';

class TestimonialMediumScreen extends StatelessWidget {
  TestimonialMediumScreen({super.key});
  final TestimonialController testimonialController = Get.put(TestimonialController());

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
                  ...List.generate(
                    testimonialController.testimonials.length, 
                    (index) => CustomTestimonialColumn(
                      title: testimonialController.testimonials[index]["title"],
                      data: testimonialController.testimonials[index]["data"],
                      image: testimonialController.testimonials[index]["image"],
                      selected: testimonialController.testimonials[index]["selected"],
                    )
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                ],
              ),
            ),
          ],
        ),
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
            textColor: Colors.white,
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
                      color: Colors.white60,
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
                      color: Colors.white60,
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 2,
                    color: Colors.white60,
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
              const CustomSpacing(height: .05),
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
            textColor: Colors.white,
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
              textColor: Colors.white,
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
            textColor: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          const CustomSpacing(width: .012),
          CustomText(
            text: value, 
            fontSize: 16, 
            textColor: Colors.white,
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
            textColor: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          const CustomSpacing(width: .012),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: CustomText(
                text: value,
                fontSize: MediaQuery.of(context).size.width > 580 ? 16 : 14,
                textColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}