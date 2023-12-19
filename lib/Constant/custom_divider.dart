import "package:flutter/material.dart";

class CustomDivider extends StatelessWidget {
  final double screenSize;
  const CustomDivider({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize * 0.015,
      ),
      child: Row(
        children: [
          Container(
            height: 1,
            width: screenSize * 0.2,
            color: Colors.blue[900],
          ),
          Expanded(
            child: Container(
              height: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}