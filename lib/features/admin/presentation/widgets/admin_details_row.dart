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
    // Check if the imagePath is a network URL or a local asset
    bool isNetworkImage =
        imagePath.startsWith('http://') || imagePath.startsWith('https://');
    bool hasImage = imagePath.isNotEmpty;

    return Container(
      color: Colors.white,
      height: 56.h,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle image rendering dynamically based on path type
          if (!hasImage)
            Container(
              height: 35.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person, size: 20.r, color: Colors.grey),
            )
          else if (isNetworkImage)
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                imagePath,
                height: 35.h,
                width: 40.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 35.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person, size: 20.r, color: Colors.grey),
                ),
              ),
            )
          else
            Image.asset(
              imagePath,
              height: 35.h,
              width: 40.w,
              fit: BoxFit.cover,
            ),

          SizedBox(width: 12.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  color: AppColor.blue,
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
