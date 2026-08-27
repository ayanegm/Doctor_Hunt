import 'package:flutter/material.dart';

class RegisterationWidgesType extends StatelessWidget {
  const RegisterationWidgesType({
    super.key,
    required this.title,
    required this.onTap,
    required this.imageLink,
  });
  final String title;
  final VoidCallback onTap;
  final String imageLink;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageLink, height: 18.17, width: 18.17),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
