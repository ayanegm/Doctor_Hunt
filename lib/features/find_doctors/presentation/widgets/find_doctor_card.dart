import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final scaleWidth = screenWidth / 375;
    final scaleHeight = screenHeight / 812;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16 * scaleWidth,
        vertical: 6 * scaleHeight, // Reduced slightly to prevent overflow
      ),
      padding: EdgeInsets.all(12 * scaleWidth),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Doctor Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12 * scaleWidth),
            child: Image.asset(
              Assets.liveDoctorsBackground,
              width: 75 * scaleWidth,
              height: 90 * scaleHeight,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 75 * scaleWidth,
                height: 90 * scaleHeight,
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Dr.Crownover',
                        style: TextStyle(
                          fontSize: 15 * scaleWidth,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF222222),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                        size: 20 * scaleWidth,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2 * scaleHeight),
                Text(
                  'Tooth Dentist',
                  style: TextStyle(
                    fontSize: 12 * scaleWidth,
                    color: const Color(0xFF0EBE7F),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2 * scaleHeight),
                const Text(
                  '9 Years experience',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
                SizedBox(height: 4 * scaleHeight),
                Row(
                  children: [
                    Container(
                      width: 7 * scaleWidth,
                      height: 7 * scaleHeight,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0EBE7F),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4 * scaleWidth),
                    Text(
                      '87%',
                      style: TextStyle(
                        fontSize: 11 * scaleWidth,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF222222),
                      ),
                    ),
                    SizedBox(width: 8 * scaleWidth),
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 11 * scaleWidth,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4 * scaleWidth),
                    const Expanded(
                      child: Text(
                        '69 Patient Stories',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: scaleHeight * 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Next Available',
                          style: TextStyle(
                            fontSize: 9 * scaleWidth,
                            color: const Color(0xFF0EBE7F),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          'nextAvailable',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 28 * scaleHeight,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0EBE7F),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12 * scaleWidth,
                          ),
                          minimumSize: Size(70 * scaleWidth, 28 * scaleHeight),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6 * scaleWidth),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                            fontSize: 10 * scaleWidth,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
