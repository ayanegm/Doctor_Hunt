import 'package:doctor_hunt/core/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.h,
      width: 48.w,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          value: true,
          activeThumbColor: AppColor.green,
          onChanged: (val) {},
        ),
      ),
    );
  }
}
