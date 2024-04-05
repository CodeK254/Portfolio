import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/views/home/testimonial_controller.dart';
import 'package:portfolio/app/widgets/spacing.dart';
import 'package:portfolio/app/widgets/text.dart';

class TestimonialScreen extends StatelessWidget {
  TestimonialScreen({super.key});
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
                    )
                  )
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
  final String image;
  const CustomTestimonialColumn({
    super.key, required this.data, required this.title, required this.image,
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
          const CustomSpacing(height: .05),
          Row(
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
              CustomSpacing(width: .05),
              Expanded(
                flex: 3,
                child: AspectRatio(
                  aspectRatio: 2 / 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
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
      padding: const EdgeInsets.symmetric(vertical  : 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
      ),
    );
  }
}