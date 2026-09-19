import 'package:doctor_hunt/core/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDetailsRow extends StatelessWidget {
  const AdminDetailsRow({
    super.key,
    required this.title,
    required this.value,
    this.widget,
    required this.imagePath,
  });
  final String title;
  final String value;
  final Widget? widget;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 56.h,
      width: double.infinity,
      child: Row(
        children: [
          Image.asset(imagePath, height: 18.33.w, width: 18.33.w),
          SizedBox(width: 12.w),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.w600,

                  fontSize: 12.sp,
                  color: AppColor.grey,
                ),
              ),
            ],
          ),
          Spacer(),
          if (widget != null) widget!,
        ],
      ),
    );
  }
}
