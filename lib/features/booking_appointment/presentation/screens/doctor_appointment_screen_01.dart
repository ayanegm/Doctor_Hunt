import 'package:doctor_hunt/custom_scaffold.dart';
import 'package:doctor_hunt/features/doctor_details/presentation/widgets/doctor_card.dart';
import 'package:doctor_hunt/features/onboarding/widgets/get_started_button.dart';
import 'package:doctor_hunt/widgets/custom_text_field.dart';
import 'package:doctor_hunt/widgets/department_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorAppointmentScreen01 extends StatelessWidget {
  const DoctorAppointmentScreen01({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    TextEditingController patientName = TextEditingController();
    TextEditingController contactNumber = TextEditingController();

    return CustomScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 0.048 * screenWidth,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  Text(
                    'Appointment',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            DoctorProfileCard(),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  DepartmentTitleWidget(hintText: 'Appointment For'),
                  SizedBox(height: 20.h),

                  CustomTextField(
                    hintText: 'Patient Name',
                    isPassword: false,
                    controller: patientName,
                  ),
                  SizedBox(height: 18.h),

                  CustomTextField(
                    hintText: 'Contact Number',
                    isPassword: false,
                    controller: contactNumber,
                  ),
                  SizedBox(height: 25.h),
                  DepartmentTitleWidget(hintText: 'Who is this patient?'),
                  SizedBox(height: 20.h),
                  GetStartedButton(onTap: () {}, title: 'Next'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
