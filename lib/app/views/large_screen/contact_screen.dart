import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/widgets/spacing.dart';
import 'package:portfolio/app/widgets/text.dart';

class ContactLargeScreen extends StatelessWidget {
  const ContactLargeScreen({super.key});

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
                        child: Container(
                          height: MediaQuery.of(context).size.height * .2,
                          color: Colors.black,
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