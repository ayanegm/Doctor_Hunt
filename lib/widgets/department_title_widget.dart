import 'package:flutter/material.dart';

class DepartmentTitleWidget extends StatelessWidget {
  const DepartmentTitleWidget({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Text(
      hintText,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 0.043 * screenWidth,
        height: 1.0,
      ),
    );
  }
}
