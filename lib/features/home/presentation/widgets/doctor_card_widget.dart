import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';

class DoctorCardWidget extends StatelessWidget {
  const DoctorCardWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      // height: screenHeight * 0.325,
      width: screenWidth * 0.506,
      child: Column(
        children: [
          Container(
            height: 0.20 * screenHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(2),
                bottomRight: Radius.circular(2),
              ),
              image: DecorationImage(
                image: AssetImage(Assets.liveDoctorsBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 0.017 * screenHeight),
          Text(
            'Dr. Fillerup Grab',
            style: TextStyle(
              fontSize: screenWidth * 0.038,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 0.002 * screenHeight),
          Text(
            'Medicine Specialist',
            style: TextStyle(
              fontSize: screenWidth * 0.028,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 0.007 * screenHeight),
        ],
      ),
    );
  }
}
