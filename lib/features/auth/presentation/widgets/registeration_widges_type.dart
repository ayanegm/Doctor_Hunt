import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterationWidgesType extends StatelessWidget {
  const RegisterationWidgesType({
    super.key,
    required this.title,
    required this.onTap,
    required this.imageLink,
  });
  final String title;
  final VoidCallback onTap;
  final String imageLink;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54.h,
        width: 160.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageLink, height: 18.17.h, width: 18.17.w),
            SizedBox(width: 12.w),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
