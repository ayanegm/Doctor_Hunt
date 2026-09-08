import 'package:flutter/material.dart';
import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/generated/assets.dart';

class FeatureDoctorCard extends StatelessWidget {
  const FeatureDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.256,
      padding: EdgeInsets.all(screenWidth * 0.025),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.favorite_border, size: 9, color: Colors.grey),
              Row(
                children: [
                  const Icon(Icons.star, size: 9, color: Colors.amber),
                  SizedBox(width: screenWidth * 0.01),
                  const Text(
                    '3.7',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.008),

          CircleAvatar(
            radius: screenWidth * 0.075,
            backgroundImage: AssetImage(Assets.HomecircleImage),
          ),

          SizedBox(height: screenHeight * 0.008),

          const Text(
            'Dr. Crick',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: screenHeight * 0.003),

          const Text(
            '\$25.00/hour',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0EBE7F),
            ),
          ),
        ],
      ),
    );
  }
}
