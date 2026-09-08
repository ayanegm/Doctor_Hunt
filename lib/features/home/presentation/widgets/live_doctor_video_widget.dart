import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';

class LiveDoctorVideoWidget extends StatelessWidget {
  const LiveDoctorVideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 0.20 * screenHeight,
      width: 0.310 * screenWidth,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(Assets.liveDoctorsBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 11,
            right: 11.16,

            child: Image.asset(
              Assets.liveIcon,
              width: 0.107 * screenWidth,
              height: 0.022 * screenHeight,
            ),
          ),
          Center(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 0.0773 * screenWidth,
            ),
          ),
        ],
      ),
    );
  }
}
