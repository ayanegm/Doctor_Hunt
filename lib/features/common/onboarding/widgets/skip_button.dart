import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.fontSize});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Text(
        'skip',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: screenWidth * 0.038,
          color: Color(0xFF677294),
        ),
      ),
    );
  }
}
