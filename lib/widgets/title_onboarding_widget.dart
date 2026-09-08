import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
