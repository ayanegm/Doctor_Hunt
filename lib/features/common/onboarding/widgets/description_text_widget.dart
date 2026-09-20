import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionTextWidget extends StatelessWidget {
  const DescriptionTextWidget({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Text(
      description,
      style: TextStyle(
        color: Color(0xFF677294),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
