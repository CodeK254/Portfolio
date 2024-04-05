import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ServicesController extends GetxController with GetTickerProviderStateMixin{
  Animation? flipAnimation;
  AnimationController? flipAnimationController;
  RxString time = "00 : 00 : 00".obs;
  RxString date = "".obs;

  List<Rx<Color>> tileColor = [
    Colors.grey.shade900.obs,
    Colors.grey.shade900.obs,
    Colors.grey.shade900.obs,
    Colors.grey.shade900.obs,
    Colors.grey.shade900.obs,
    Colors.grey.shade900.obs,
  ];

  void initiate() async {
    final data = GetTime().stream;

    data.listen((event) {
      DateTime dateTime = DateTime.parse(event.toString());
      date.value = formatDate(dateTime);
      time.value = formatTime(dateTime);
    });
  }

  String formatDate(DateTime dateTime){
    return date.value = "${dateTime.day < 10 ? "0${dateTime.day}" : dateTime.day} ${dateTime.month < 10 ? "0${dateTime.month}" : dateTime.month}, ${dateTime.year < 10 ? "0${dateTime.year}" : dateTime.year}";
  }

  String formatTime(DateTime dateTime){
    return time.value = "${dateTime.hour < 10 ? "0${dateTime.hour}" : dateTime.hour} : ${dateTime.minute < 10 ? "0${dateTime.minute}" : dateTime.minute} : ${dateTime.second < 10 ? "0${dateTime.second}" : dateTime.second}  ";
  }

  void resetColors() {
    for(int i = 0; i < 6; i++){
      tileColor[i].value = Colors.grey.shade900;
    }
  }

  final List<Map<String, dynamic>> services = [
    {
      "icon": FontAwesomeIcons.android,
      "color": Colors.green,
      "label": "Android",
      "description": """
Platform-Specific Optimization: Harness the full potential of Android and iOS by developing native apps that seamlessly integrate with each platform's features and functionalities.

Unmatched Performance: Achieve peak performance and leverage the latest features available on each platform by building native apps.

Deep Device Integration: Unlock the full potential of device-specific functionalities like cameras, sensors, and advanced hardware capabilities through native development.
"""
    },
    {
      "icon": FontAwesomeIcons.mobile,
      "color": Colors.blue,
      "label": "iOS",
      "description": """
Cupertino Widgets: Flutter offers a built-in set of Cupertino widgets that adhere to Apple's design guidelines, allowing you to create apps with an authentic iOS look and feel.

Faster Development: The single codebase approach of Flutter allows for quicker development for iOS compared to building a native app from scratch.
""",
    },
    {
      "icon": FontAwesomeIcons.database,
      "color": Colors.brown,
      "label": "Database",
      "description": """
Robust and Scalable: Ideal for web applications and e-commerce platforms requiring a reliable and high-performance foundation. MySQL excels at handling large datasets efficiently.

Structured Data Management: Utilize MySQL's strength in storing and manipulating well-defined, relational data. This ensures data integrity and simplifies complex queries for structured information.

Wide Community & Support: Benefit from a vast developer community and extensive resources readily available for MySQL, making it easier to find solutions and support.
""",
    },
    {
      "icon": FontAwesomeIcons.check,
      "color": Colors.yellow,
      "label": "Testing",
      "description": """
Performance Optimization: I conduct performance testing to identify bottlenecks and optimize your application for speed and responsiveness, delivering a smooth user experience even under heavy loads.

Comprehensive Testing Strategies: I can design and implement a multi-layered testing approach that encompasses unit testing, integration testing, UI/UX testing, and performance testing to guarantee the quality, functionality, and user-friendliness of your application.
""",
    },
    {
      "icon": FontAwesomeIcons.server,
      "color": Colors.orange,
      "label": "Deployment",
      "description": """
Platform-Specific Expertise: Whether you're targeting app stores (iOS App Store, Google Play Store) or web hosting platforms, I possess the knowledge to navigate the deployment process for each platform efficiently.

Monitoring & Performance Optimization: Once deployed, I can set up monitoring tools to track performance metrics and identify potential issues. This allows for proactive optimization and ensures a smooth user experience.

""",
    },
    {
      "icon": CupertinoIcons.settings,
      "color": Colors.red,
      "label": "Maintenance",
      "description": """
Continuous Integration & Delivery (CI/CD): I can integrate CI/CD practices to automate building, testing, and deployment stages, enabling frequent and reliable updates to your app or website.

Security & Compliance: Security is paramount. I prioritize implementing best practices for secure deployments, ensuring your app or website adheres to relevant security standards and user data is protected.
""",
    },
  ];

  @override
  void onInit() {
    flipAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    flipAnimation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(flipAnimationController!);

    flipAnimationController!.forward();

    initiate();

    super.onInit();
  }
}

class GetTime{
  // StreamController declaration
  final _controller = StreamController<DateTime>();
  
  DateTime dateTime = DateTime.now();

  // Updating Datetime
  GetTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _controller.sink.add(dateTime);
      dateTime = DateTime.now();
    });
  }

  Stream<DateTime> get stream => _controller.stream;
}