import 'package:doctor_hunt/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:doctor_hunt/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/custom_scaffold.dart';
import 'package:doctor_hunt/features/find_doctors/presentation/widgets/find_doctor_card.dart';

class FindDoctorPage extends StatefulWidget {
  const FindDoctorPage({super.key});

  @override
  State<FindDoctorPage> createState() => _FindDoctorPageState();
}

class _FindDoctorPageState extends State<FindDoctorPage> {
  int _currentIndex = 1;

  final TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return CustomScaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 0.048 * screenWidth,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  const Text(
                    'Find Doctors',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.053 * screenWidth),
              child: SearchTextField(hintText: 'Search', controller: text),
            ),

            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return DoctorCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
