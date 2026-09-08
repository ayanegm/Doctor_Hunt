import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/assets.dart';

class DoctorProfileCard extends StatelessWidget {
  const DoctorProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final scaleWidth = screenWidth / 375;
    final scaleHeight = screenHeight / 812;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16 * scaleWidth),
      padding: EdgeInsets.all(16 * scaleWidth),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16 * scaleWidth),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12 * scaleWidth),
                child: Image.asset(
                  Assets.liveDoctorsBackground,
                  width: 70 * scaleWidth,
                  height: 70 * scaleHeight,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 70 * scaleWidth,
                    height: 70 * scaleHeight,
                    color: Colors.grey[200],
                    child: const Icon(Icons.person, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(width: 12 * scaleWidth),

              // Details Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name & Favorite Icon Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Dr. Pediatrician',
                            style: TextStyle(
                              fontSize: 15 * scaleWidth,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF222222),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Icon(Icons.favorite, color: Colors.red, size: 20),
                      ],
                    ),
                    SizedBox(height: 4 * scaleHeight),

                    // Specialty
                    const Text(
                      'Specialist Cardiologist',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    SizedBox(height: 8 * scaleHeight),

                    // Rating Stars & Hourly Rate Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),
                          ),
                        ),
                        Text(
                          '\$28.00/hr',
                          style: TextStyle(
                            fontSize: 13 * scaleWidth,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0EBE7F),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16 * scaleHeight),

          // Book Now Button
          SizedBox(
            width: double.infinity,
            height: 40 * scaleHeight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0EBE7F),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8 * scaleWidth),
                ),
                elevation: 0,
              ),
              child: Text(
                'Book Now',
                style: TextStyle(
                  fontSize: 14 * scaleWidth,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
