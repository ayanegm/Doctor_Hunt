import 'package:doctor_hunt/core/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: TableCalendar(
          focusedDay: today,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 10, 16),
          rowHeight: 31.h,
          daysOfWeekHeight: 20.h,
          calendarFormat: CalendarFormat.month,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            headerPadding: EdgeInsets.zero,
            decoration: const BoxDecoration(color: AppColor.green),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
            leftChevronIcon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
            rightChevronIcon: const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: Colors.black54, fontSize: 11),
            weekendStyle: TextStyle(color: Colors.black54, fontSize: 11),
          ),
          calendarStyle: const CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: AppColor.green,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: Color(0x3323C197),
              shape: BoxShape.circle,
            ),
            defaultTextStyle: TextStyle(color: Colors.black87, fontSize: 11),
            weekendTextStyle: TextStyle(color: Colors.black87, fontSize: 11),
            todayTextStyle: TextStyle(color: Colors.black87, fontSize: 11),
            selectedTextStyle: TextStyle(color: Colors.white, fontSize: 11),
            outsideTextStyle: TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ), // Controls previous/next month days
          ),
          selectedDayPredicate: (day) => isSameDay(today, day),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              today = selectedDay;
            });
          },
        ),
      ),
    );
  }
}
