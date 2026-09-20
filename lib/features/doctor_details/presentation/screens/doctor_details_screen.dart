import 'package:doctor_hunt/features/doctor_details/presentation/widgets/doctor_card.dart';
import 'package:doctor_hunt/widgets/custom_scaffold.dart';
import 'package:doctor_hunt/features/find_doctors/presentation/widgets/find_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/assets.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final scaleWidth = screenWidth / 375;
    final scaleHeight = screenHeight / 812;

    return CustomScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16 * scaleWidth,
            vertical: 8 * scaleHeight,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1 * scaleWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 18,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'Doctor Details',
                      style: TextStyle(
                        color: const Color(0xFF222222),
                        fontSize: 16 * scaleWidth,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                DoctorProfileCard(),
                SizedBox(height: 20 * scaleHeight),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 14 * scaleHeight),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12 * scaleWidth),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.05),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _StatItem(count: '100', label: 'Runing'),
                      _VerticalDivider(),
                      _StatItem(count: '500', label: 'Ongoing'),
                      _VerticalDivider(),
                      _StatItem(count: '700', label: 'Patient'),
                    ],
                  ),
                ),
                SizedBox(height: 24 * scaleHeight),

                // Services Headline & List
                Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 16 * scaleWidth,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF222222),
                  ),
                ),
                SizedBox(height: 12 * scaleHeight),
                const _ServiceItem(
                  number: '1.',
                  text: 'Patient care should be the number one priority.',
                ),
                SizedBox(height: 8 * scaleHeight),
                const _ServiceItem(
                  number: '2.',
                  text: 'If you run your practice you know how frustrating.',
                ),
                SizedBox(height: 8 * scaleHeight),
                const _ServiceItem(
                  number: '3.',
                  text: "That's why some of appointment reminder system.",
                ),
                SizedBox(height: 11 * scaleHeight),

                ClipRRect(
                  borderRadius: BorderRadius.circular(12 * scaleWidth),
                  child: Container(
                    height: 190 * scaleHeight,
                    width: double.infinity,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(Assets.map, fit: BoxFit.cover),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Helper Widgets to keep code clean
class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xFF222222),
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(height: 24, width: 1, color: Colors.grey[200]);
  }
}

class _ServiceItem extends StatelessWidget {
  final String number;
  final String text;

  const _ServiceItem({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
