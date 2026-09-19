import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/onboarding/onboarding_page_03.dart';
import 'package:doctor_hunt/features/onboarding/widgets/description_text_widget.dart';
import 'package:doctor_hunt/features/onboarding/widgets/get_started_button.dart';
import 'package:doctor_hunt/features/onboarding/widgets/skip_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage02 extends StatelessWidget {
  const OnboardingPage02({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/images/bg.png', height: 216, width: 216),
          ),

          Column(
            children: [
              SizedBox(
                height: 447,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: -20,
                      left: 175,
                      child: Image.asset(
                        'assets/images/Ellipse 153 (1).png',
                        height: 342,
                        width: 342,
                      ),
                    ),
                    Positioned(
                      top: 91,
                      left: 20,
                      child: Image.asset(
                        'assets/images/Ellipse 154 (1).png',
                        height: 336,
                        width: 336,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 85),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 43.0),
                child: Column(
                  children: [
                    Text(
                      AppStrings.onBoarding2Title,
                      style: TextStyles.onBoardingTitle,
                    ),

                    SizedBox(height: 11),
                    DescriptionTextWidget(
                      description:
                          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                    ),
                    SizedBox(height: 52),
                    GetStartedButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return OnboardingPage03();
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 14),
                    SkipButton(fontSize: screenWidth * 0.038),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
