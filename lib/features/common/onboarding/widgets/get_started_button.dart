import 'package:doctor_hunt/core/utils/color.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
    this.title = 'Get Started',
    required this.onTap,

    this.fontSize,
  });
  final String title;
  final VoidCallback onTap;

  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.8,
        height: screenHeight * 0.065,
        decoration: BoxDecoration(
          color: AppColor.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: fontSize ?? screenWidth * 0.048,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
