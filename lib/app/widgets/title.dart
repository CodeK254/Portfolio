import "package:flutter/material.dart";
import "package:portfolio/app/widgets/spacing.dart";
import "package:portfolio/app/widgets/text.dart";

class CustomLabel extends StatelessWidget {
  final String label;
  const CustomLabel({
    super.key, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label, 
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
    );
  }
}