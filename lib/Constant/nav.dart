import "package:flutter/material.dart";
import 'package:portfolio_website/Constant/custom_divider.dart';
import 'package:portfolio_website/Constant/custom_text.dart';
import 'package:portfolio_website/Data/dummy.dart';
import 'package:portfolio_website/Data/launch_url.dart';

class NavigatorContainer extends StatefulWidget {
  const NavigatorContainer({super.key});

  @override
  State<NavigatorContainer> createState() => _NavigatorContainerState();
}

class _NavigatorContainerState extends State<NavigatorContainer> {
  List<Color> tileTwoColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  List<Color> textTwoColor = [
    Colors.grey.shade900,
    Colors.grey.shade900,
    Colors.grey.shade900,
    Colors.grey.shade900,
    Colors.grey.shade900,
    Colors.grey.shade900,
    Colors.grey.shade900,
    Colors.grey.shade900,
    Colors.grey.shade900,
    Colors.grey.shade900,
    Colors.grey.shade900,
    Colors.grey.shade900,
  ];
  int selectedTwo = -1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.transparent,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpansionTile(
              initiallyExpanded: true,
              title: CustomText(
                text: "Projects",
                fontSize: 20,
                color: Colors.brown,
              ),
              expandedAlignment: Alignment.topCenter,
              maintainState: true,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                  projects.length, 
                  (index) => InkWell(
                    onHover: (val){
                      setState(() {
                        for(int a = 0; a < tileTwoColor.length; a++){
                          if(a == selectedTwo){
                            continue;
                          }
                          tileTwoColor[a] = Colors.white;
                          textTwoColor[a] = Colors.grey.shade900;
                        }
                        if(index != selectedTwo){
                          tileTwoColor[index] = Colors.brown.shade100;
                          textTwoColor[index] = Colors.white;
                        }
                      });
                    },
                    onTap: (){
                      setState(() {
                        for(int a = 0; a < tileTwoColor.length; a++){
                          tileTwoColor[a] = Colors.white;
                          textTwoColor[a] = Colors.grey.shade900;
                        }
                        selectedTwo = index;
                        tileTwoColor[index] = Colors.brown;
                        textTwoColor[index] = Colors.white;
                      });
                      navigateTo(projects[index]["url"]);
                    },
                    child: ListTile(
                      tileColor: tileTwoColor[index],
                      title: CustomText(
                        text: projects[index]["label"],
                        fontSize: 15,
                        color: textTwoColor[index],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CustomDivider(screenSize: MediaQuery.of(context).size.width * 0.3),
          ],
        ),
      ),
    );
  }
}