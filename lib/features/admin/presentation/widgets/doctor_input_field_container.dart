import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorInputFieldContainer extends StatelessWidget {
  final Widget child;
  final Widget? leadingIcon;

  const DoctorInputFieldContainer({
    super.key,
    required this.child,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          if (leadingIcon != null) ...[leadingIcon!, SizedBox(width: 12.w)],
          Expanded(child: child),
        ],
      ),
    );
  }
}
