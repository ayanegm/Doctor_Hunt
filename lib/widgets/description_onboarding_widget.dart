import 'package:flutter/material.dart';

class DescriptionOnboardingWidget extends StatelessWidget {
  const DescriptionOnboardingWidget({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        color: Color(0xFF677294),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
