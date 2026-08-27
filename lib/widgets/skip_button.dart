import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Text(
        'skip',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Color(0xFF677294),
        ),
      ),
    );
  }
}
