import 'package:doctor_hunt/core/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDetailsRow extends StatelessWidget {
  const AdminDetailsRow({
    super.key,
    required this.title,
    required this.value,
    this.widget,
    this.adminPhoto,
    this.isSettingsRow = false,
  });

  final String title;
  final String value;
  final Widget? widget;
  final String? adminPhoto;
  final bool isSettingsRow;

  @override
  Widget build(BuildContext context) {
    bool hasAdminPhoto = adminPhoto != null && adminPhoto!.isNotEmpty;
    bool isNetworkImage =
        hasAdminPhoto &&
        (adminPhoto!.startsWith('http://') ||
            adminPhoto!.startsWith('https://'));

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      constraints: BoxConstraints(minHeight: 56.h),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isSettingsRow)
            Container(
              height: 35.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getSettingsIcon(title),
                size: 18.r,
                color: AppColor.blue,
              ),
            )
          else if (!hasAdminPhoto)
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
                adminPhoto!,
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
            SizedBox(
              height: 35.h,
              width: 40.w,
              child: Image.asset(adminPhoto!, fit: BoxFit.contain),
            ),

          SizedBox(width: 12.w),

          // Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: AppColor.blue,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          if (widget != null) ...[SizedBox(width: 8.w), widget!],
        ],
      ),
    );
  }

  IconData _getSettingsIcon(String title) {
    if (title.contains('Profile')) return Icons.person_outline;
    if (title.contains('Password')) return Icons.lock_outline;
    if (title.contains('Notification')) return Icons.notifications_outlined;
    return Icons.info_outline;
  }
}
