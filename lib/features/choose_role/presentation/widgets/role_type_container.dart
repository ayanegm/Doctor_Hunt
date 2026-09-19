import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleTypeContainer extends StatelessWidget {
  const RoleTypeContainer({
    super.key,
    required this.title,
    required this.description,
    this.isSelected = false,
    required this.onTap,
    required this.iconPath,
  });

  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: isSelected ? const Color(0xFFFAFCFB) : const Color(0xFFE6ECEA),
          border: Border.all(
            color: isSelected ? AppColor.darkGreen : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(iconPath, height: 45.h, width: 34.67.w),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        description,
                        style: TextStyle(fontSize: 14.sp, color: AppColor.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (isSelected)
              Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 24.r,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
