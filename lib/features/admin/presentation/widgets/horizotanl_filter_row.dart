import 'package:doctor_hunt/core/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalFilterChips extends StatefulWidget {
  const HorizontalFilterChips({super.key});

  @override
  State<HorizontalFilterChips> createState() => _HorizontalFilterChipsState();
}

class _HorizontalFilterChipsState extends State<HorizontalFilterChips> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _filters = [
    {'title': 'All', 'count': 12},
    {'title': 'Cardiology', 'count': 3},
    {'title': 'Orthopedic', 'count': 2},
    {'title': 'Dentist', 'count': 5},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;

          return ChoiceChip(
            label: Text(
              '${_filters[index]['title']} (${_filters[index]['count']})',
            ),
            selected: isSelected,
            selectedColor: AppColor.green,
            backgroundColor: Colors.white,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
            showCheckmark: false,
            labelPadding: EdgeInsets.zero,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: isSelected ? AppColor.green : Colors.white,
                width: 1,
              ),
            ),
            onSelected: (bool selected) {
              setState(() {
                _selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
