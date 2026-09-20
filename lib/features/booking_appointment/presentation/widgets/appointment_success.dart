import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/features/common/onboarding/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentSuccess extends StatelessWidget {
  const AppointmentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 95.w,
              height: 95.h,
              decoration: BoxDecoration(
                color: AppColor.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.thumb_up_rounded,
                color: AppColor.green,
                size: 45.sp,
              ),
            ),
            SizedBox(height: 16.h),

            Text(
              'Thank You !',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4.h),

            Text(
              'Your Appointment Successful',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.blue,
              ),
            ),
            SizedBox(height: 14.h),

            Text(
              'You booked an appointment with Dr.\nPediatrician Purpieson on February 21,\nat 02:00 PM',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColor.blue,
                height: 1.4,
              ),
            ),
            SizedBox(height: 20.h),

            // Done Button
            GetStartedButton(
              title: 'Done',
              onTap: () {
                Navigator.pop(context);
              },
            ),

            // Edit Text Button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Edit your appointment',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColor.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
