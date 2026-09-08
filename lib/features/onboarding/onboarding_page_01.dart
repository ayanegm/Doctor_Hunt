import 'package:doctor_hunt/custom_scaffold.dart';
import 'package:doctor_hunt/features/onboarding/onboarding_page_02.dart';
import 'package:doctor_hunt/features/onboarding/widgets/description_text_widget.dart';
import 'package:doctor_hunt/features/onboarding/widgets/get_started_button.dart';
import 'package:doctor_hunt/features/onboarding/widgets/skip_button.dart';
import 'package:doctor_hunt/widgets/title_onboarding_widget.dart';
import 'package:flutter/material.dart';

class OnboardingPage01 extends StatelessWidget {
  const OnboardingPage01({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return CustomScaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.55,
            width: screenWidth,
            child: Stack(
              children: [
                Positioned(
                  top: -screenHeight * 0.024,
                  left: -screenWidth * 0.277,
                  child: Image.asset(
                    'assets/images/Ellipse 153.png',
                    height: screenWidth * 0.912,
                    width: screenWidth * 0.912,
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.112,
                  left: screenWidth * 0.053,
                  child: Image.asset(
                    'assets/images/Ellipse 154.png',
                    height: screenWidth * 0.89,
                    width: screenWidth * 0.89,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              children: [
                TitleOnboardingWidget(
                  title: 'Find Trusted Doctors',
                  fontSize: screenWidth * 0.075,
                ),
                SizedBox(height: screenHeight * 0.015),
                DescriptionTextWidget(
                  description:
                      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                ),
                SizedBox(height: screenHeight * 0.04),
                GetStartedButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OnboardingPage02();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                SkipButton(fontSize: screenWidth * 0.038),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
