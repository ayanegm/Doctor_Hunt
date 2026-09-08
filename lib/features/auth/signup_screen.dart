import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/features/auth/presentation/screens/login_page.dart';
import 'package:doctor_hunt/widgets/custom_text_field.dart';
import 'package:doctor_hunt/features/onboarding/widgets/description_text_widget.dart';
import 'package:doctor_hunt/features/onboarding/widgets/get_started_button.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/registeration_widges_type.dart';
import 'package:doctor_hunt/widgets/title_onboarding_widget.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: -7,
            right: -10,
            child: Image.asset('assets/images/bg.png', height: 216, width: 216),
          ),
          Positioned(
            top: -18,
            left: -18,
            child: Image.asset(
              'assets/images/Ellipse 142.png',
              height: 216,
              width: 216,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 152),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      TitleOnboardingWidget(
                        title: 'Join us to start searching',
                      ),
                      SizedBox(height: 15),

                      DescriptionTextWidget(
                        description:
                            'You can search c ourse, apply course and find scholarship for abroad studies',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 67),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RegisterationWidgesType(
                      title: 'Google',
                      onTap: () {},
                      imageLink: 'assets/images/Group.png',
                    ),
                    const SizedBox(width: 15),
                    RegisterationWidgesType(
                      title: 'Facebook',
                      onTap: () {},
                      imageLink: 'assets/images/Group (1).png',
                    ),
                  ],
                ),
                SizedBox(height: 34),
                CustomTextField(
                  controller: name,
                  isPassword: false,
                  hintText: 'Name',
                ),
                SizedBox(height: 18),
                CustomTextField(
                  controller: email,
                  isPassword: false,
                  hintText: 'Email',
                ),
                SizedBox(height: 18),
                CustomTextField(
                  controller: password,
                  isPassword: true,
                  hintText: 'Password',
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/Ellipse 163.png',
                      height: 16,
                      width: 16,
                    ),
                    SizedBox(width: 10),

                    Text(
                      'I agree with the Terms of Service & Privacy Policy',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 54),
                GetStartedButton(title: 'sign up', onTap: () {}),
                SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account?',
                      style: TextStyle(
                        color: Color(0xFF0EBE7F),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
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
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color: Color(0xFF0EBE7F),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
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
