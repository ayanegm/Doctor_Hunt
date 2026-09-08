import 'package:doctor_hunt/core/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSlotsWidget extends StatefulWidget {
  final bool isSelected;
  final String primaryText;
  final String secondaryText;

  const TimeSlotsWidget({
    super.key,
    this.isSelected = false,
    required this.primaryText,
    required this.secondaryText,
  });

  @override
  State<TimeSlotsWidget> createState() => _TimeSlotsWidgetState();
}

class _TimeSlotsWidgetState extends State<TimeSlotsWidget> {
  late bool isSelected;
  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: 60.h,
        width: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.green : AppColor.green.withOpacity(0.08),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.primaryText,
              style: TextStyle(
                fontSize: 14.sp,
                color: isSelected ? AppColor.white : AppColor.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              widget.secondaryText,
              style: TextStyle(
                fontSize: 14.sp,

                color: isSelected ? AppColor.white : AppColor.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
