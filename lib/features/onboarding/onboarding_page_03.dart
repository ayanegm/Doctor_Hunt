import 'package:doctor_hunt/features/login/login_page.dart';
import 'package:doctor_hunt/widgets/description_onboarding_widget.dart';
import 'package:doctor_hunt/widgets/get_started_button.dart';
import 'package:doctor_hunt/widgets/skip_button.dart';
import 'package:doctor_hunt/widgets/title_onboarding_widget.dart';
import 'package:flutter/material.dart';

class OnboardingPage03 extends StatelessWidget {
  const OnboardingPage03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 447,
            width: 460,
            child: Stack(
              children: [
                Positioned(
                  top: -20,
                  left: -104,
                  child: Image.asset(
                    'assets/images/Ellipse 153.png',
                    height: 342,
                    width: 342,
                  ),
                ),
                Positioned(
                  top: 91,
                  left: 20,
                  child: Image.asset(
                    'assets/images/Ellipse 154 (2).png',
                    height: 336,
                    width: 336,
                  ),
                ),
                Positioned(
                  top: 641,
                  left: 212,
                  child: Image.asset(
                    'assets/images/bg.png',
                    height: 216,
                    width: 216,
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
                TitleOnboardingWidget(title: 'Easy Appointments', fontSize: 28),
                SizedBox(height: 11),
                DescriptionOnboardingWidget(
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
                          return LoginPage();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 14),
                SkipButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
