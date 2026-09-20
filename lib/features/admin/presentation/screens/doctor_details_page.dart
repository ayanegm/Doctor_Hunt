import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/doctor_details_row.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/switch_button.dart';
import 'package:doctor_hunt/features/common/onboarding/widgets/get_started_button.dart';
import 'package:doctor_hunt/widgets/admin_custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminCustomScaffold(
      body: Column(
        children: [
          Text(
            'Dr.Ahmed Ali',
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 2.h),
          Text(
            'Cardiologist . Senior Consultant',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            color: Colors.white,
            height: 169.h,
            child: Column(
              children: [
                DoctorDetailsRow(
                  title: 'Speciality',
                  value: 'Cardiology',
                  widget: SwitchButton(),
                  imagePath: 'assets/images/Ellipse 153 (1).png',
                ),
                SizedBox(height: 25.h),
                DoctorDetailsRow(
                  title: 'Speciality',
                  value: 'Cardiology',
                  widget: SwitchButton(),
                  imagePath: 'assets/images/Ellipse 153 (1).png',
                ),
              ],
            ),
          ),
          GetStartedButton(onTap: () {}, title: 'Edit Doctor'),
          SizedBox(height: 22.h),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Icon(Icons.delete, color: AppColor.red, size: 12),
                SizedBox(width: 6.w),
                Text(
                  'Delete Doctor',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
