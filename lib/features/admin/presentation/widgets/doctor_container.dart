import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/features/doctors/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/appointment_status.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/appointment_status_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorContainer extends StatelessWidget {
  const DoctorContainer({super.key, required this.doctorModel});
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 52.h,
                width: 52.w,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child:
                      doctorModel.imageUrl != null &&
                          doctorModel.imageUrl!.isNotEmpty
                      ? Image.network(
                          doctorModel.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(
                                Icons.person,
                                color: Colors.grey,
                                size: 30.r,
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: 30.r,
                          ),
                        ),
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorModel.name,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    doctorModel.speciality,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColor.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  AppointmentStatusContainer(
                    status: AppointmentStatus.upcoming,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
