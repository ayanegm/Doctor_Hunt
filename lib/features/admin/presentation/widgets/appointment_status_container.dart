import 'package:doctor_hunt/features/admin/presentation/widgets/appointment_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentStatusContainer extends StatelessWidget {
  const AppointmentStatusContainer({super.key, required this.status});
  final AppointmentStatus status;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: status.backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        status.label,
        style: TextStyle(
          color: status.textColor,
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
