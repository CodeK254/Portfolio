import 'package:flutter/material.dart';
import 'package:portfolio_website/Constant/custom_spacing.dart';
import 'package:portfolio_website/Constant/custom_text.dart';
import 'package:portfolio_website/Data/dummy.dart';
import 'package:portfolio_website/Data/launch_url.dart';
import "package:portfolio_website/Responsive/responsive.dart";

class CustomFooter extends StatefulWidget {
  const CustomFooter({super.key});

  @override
  State<CustomFooter> createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white
        // gradient: LinearGradient(
        //   colors: [
        //     Colors.lightBlue,
        //     Colors.white,
        //     Colors.green,
        //   ],
        // ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveWidgetScreen.isLargeScreen(context) ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Contact",
                    fontSize: 25,
                    color: Colors.blueGrey[900],
                  ),
                  const CustomVerticalSpacing(height: 0.02),
                  CustomText(
                    text: "Email: titohkaris254@gmail.com",
                    fontSize: 17,
                    color: Colors.brown[900],
                  ),
                  const CustomVerticalSpacing(height: 0.02),
                  CustomText(
                    text: "Phone: +254 742143102",
                    fontSize: 17,
                    color: Colors.brown[900],
                  ),
                  const CustomVerticalSpacing(height: 0.02),
                  CustomText(
                    text: "Github: https://github.com/CodeK254",
                    fontSize: 17,
                    color: Colors.brown[900],
                  ),
                  const CustomVerticalSpacing(height: 0.02),
                ],
              ),
              const CustomHorizontalSpacing(width: 0.3),
              Container(
                height: MediaQuery.of(context).size.height * 0.22,
                width: 2,
                color: Colors.grey,
              ),
              // const CustomHorizontalSpacing(width: 0.2),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomVerticalSpacing(height: 0.02),
                  CustomText(
                    text: "Address: 31440 - 00100",
                    fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 15 : 18,
                    color: Colors.brown[900],
                  ),
                  const CustomVerticalSpacing(height: 0.02),
                  CustomText(
                    text: "Student at Karatina University",
                    fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 15 : 18,
                    color: Colors.brown[900],
                  ),
                  const CustomVerticalSpacing(height: 0.02),
                  CustomText(
                    text: "Location: Nairobi, Kenya.",
                    fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 15 : 18,
                    color: Colors.brown[900],
                  ),
                  const CustomVerticalSpacing(height: 0.02),
                ],
              ),
            ],
          ) : Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Contact",
                      fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 18 : 23,
                      color: Colors.blueGrey[900],
                    ),
                    const CustomVerticalSpacing(height: 0.02),
                    CustomText(
                      text: "Email: titohkaris254@gmail.com",
                      fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 12 : 15,
                      color: Colors.brown[900],
                    ),
                    const CustomVerticalSpacing(height: 0.02),
                    CustomText(
                      text: "Phone: +254 742143102",
                      fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 12 : 15,
                      color: Colors.brown[900],
                    ),
                    const CustomVerticalSpacing(height: 0.02),
                    CustomText(
                      text: "Github: https://github.com/CodeK254",
                      fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 12 : 15,
                      color: Colors.brown[900],
                    ),
                    const CustomVerticalSpacing(height: 0.02),
                  ],
                ),
                Container(
                  height: 100,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.brown[400],
                    borderRadius: BorderRadius.circular(1)
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomVerticalSpacing(height: 0.02),
                    CustomText(
                      text: "Address: 31440 - 00100",
                      fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 12 : 15,
                      color: Colors.brown[900],
                    ),
                    const CustomVerticalSpacing(height: 0.02),
                    CustomText(
                      text: "Student at Karatina University",
                      fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 12 : 15,
                      color: Colors.brown[900],
                    ),
                    const CustomVerticalSpacing(height: 0.02),
                    CustomText(
                      text: "Location: Nairobi, Kenya.",
                      fontSize: ResponsiveWidgetScreen.isSmallScreen(context) ? 12 : 15,
                      color: Colors.brown[900],
                    ),
                    const CustomVerticalSpacing(height: 0.02),
                  ],
                ),
              ],
            ),
          ),
          const CustomVerticalSpacing(height: 0.02),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.blueGrey[200],
          ),
          const CustomVerticalSpacing(height: 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                portfolio[0]["social-media"]!.length, 
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: GestureDetector(
                    onTap: (){
                      navigateTo(portfolio[0]["social-media"]![index]["root"]);
                    },
                    child: Column(
                      children: [
                        Icon(
                          portfolio[0]["social-media"]![index]["icon"],
                          size: 25,
                          color: portfolio[0]["social-media"]![index]["color"],
                        ),
                        const SizedBox(height: 5),
                        ResponsiveWidgetScreen.isSmallScreen(context) ? Container() : CustomText(
                          text: portfolio[0]["social-media"]![index]["label"],
                          fontSize: 12,
                          color: Colors.teal[900],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const CustomVerticalSpacing(height: 0.03),
        ],
      ),
    );
  }
}