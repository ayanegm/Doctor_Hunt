import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/widgets/custom_scaffold.dart';
import 'package:doctor_hunt/features/booking_appointment/presentation/widgets/appointment_success.dart';
import 'package:doctor_hunt/features/booking_appointment/presentation/widgets/calender_widget.dart';
import 'package:doctor_hunt/features/booking_appointment/presentation/widgets/time_slots_widget.dart';
import 'package:doctor_hunt/features/common/onboarding/widgets/get_started_button.dart';
import 'package:doctor_hunt/widgets/department_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class DoctorAppointmentScreen02 extends StatefulWidget {
  const DoctorAppointmentScreen02({super.key});

  @override
  State<DoctorAppointmentScreen02> createState() =>
      _DoctorAppointmentScreen02State();
}

class _DoctorAppointmentScreen02State extends State<DoctorAppointmentScreen02> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
            CalenderWidget(),
            SizedBox(height: 8.h),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 27.h),
                    DepartmentTitleWidget(hintText: 'Available Time'),
                    SizedBox(height: 17.h),
                    SizedBox(
                      height: 60.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: screenWidth * 0.04),
                            child: TimeSlotsWidget(
                              primaryText: '02:00',
                              secondaryText: 'PM',
                            ),
                          );
                        },
                        itemCount: 6,
                      ),
                    ),
                    SizedBox(height: 17.h),
                    DepartmentTitleWidget(hintText: 'Reminder Me Before'),
                    SizedBox(height: 17.h),

                    SizedBox(
                      height: 60.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: screenWidth * 0.04),
                            child: TimeSlotsWidget(
                              primaryText: '25',
                              secondaryText: 'Minit',
                            ),
                          );
                        },
                        itemCount: 6,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: GetStartedButton(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible:
                                false, // Prevents closing when tapping outside
                            builder: (BuildContext context) {
                              return const AppointmentSuccess();
                            },
                          );
                        },
                        title: 'Confirm',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
