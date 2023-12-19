import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/Constant/custom_text.dart';
import 'package:portfolio_website/Constant/nav.dart';
import 'package:portfolio_website/Pages/LargeScreen/largeScreen.dart';
import 'package:portfolio_website/Pages/MediumScreen/mediumScreen.dart';
import 'package:portfolio_website/Pages/SmallScreen/smallScreen.dart';
import 'package:portfolio_website/Responsive/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      key: scaffoldKey,
      drawer: ResponsiveWidgetScreen.isSmallScreen(context) ? SafeArea(
        child: Container(
          color: Colors.white,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
            minWidth: MediaQuery.of(context).size.width * 0.5,
            minHeight: MediaQuery.of(context).size.height,
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              DrawerHeader(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.105,
                  backgroundColor: Colors.brown,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.1,
                    backgroundColor: Colors.white,
                    backgroundImage: const AssetImage("assets/logo.png"),
                  ),
                )
              ),
              Container(child: const NavigatorContainer()),
            ],
          ),
        ),
      ) : null,
      appBar: ResponsiveWidgetScreen.isSmallScreen(context) ? AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        shadowColor: Colors.grey[400],
        iconTheme: const IconThemeData(
          color: Colors.grey,
          size: 20,
        ),
        leading: GestureDetector(
          onTap: (){
            scaffoldKey.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.menu,
          ),
        ),
        title: CustomText(
          text: "Titus Kariuki",
          fontSize: 23,
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
        ),
      ) : AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        shadowColor: Colors.grey[400],
        iconTheme: const IconThemeData(
          color: Colors.grey,
          size: 20,
        ),
        leading: null,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[300],
                child: const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/logo.png"),
                ),
              ),
            ),
            const SizedBox(width: 10),
            CustomText(
              text: "Portfolio WebPage",
              fontSize: 25,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: Stack(
                children: [
                  Icon(
                    Icons.notifications,
                    size: 30,
                    color: Colors.grey[400],
                  ),
                  const Positioned(
                    top: 2,
                    right: 4,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.green,
                      ),
                    )
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              width: 2,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.grey[200],
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                  child: CustomText(
                    text: "TK",
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            CustomText(
              text: "Titus Kariuki",
              fontSize: 20,
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(width: 10),
            // AnimatedSearchBar()
          ],
        ),
      ),
      body: ResponsiveWidgetScreen(
        smallScreen: SmallScreenLayout(), 
        mediumScreen: MediumScreenLayout(),
        largeScreen: LargeScreenLayout(),
      ),
    );
  }
}