import 'package:flutter/material.dart';

class TitleOnboardingWidget extends StatelessWidget {
  const TitleOnboardingWidget({
    super.key,
    required this.title,
    this.fontSize = 24,
  });
  final String title;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
