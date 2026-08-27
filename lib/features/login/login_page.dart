import 'package:doctor_hunt/constants/color.dart';
import 'package:doctor_hunt/features/login/signup_screen.dart';
import 'package:doctor_hunt/widgets/custom_text_field.dart';
import 'package:doctor_hunt/widgets/description_onboarding_widget.dart';
import 'package:doctor_hunt/widgets/get_started_button.dart';
import 'package:doctor_hunt/widgets/registeration_widges_type.dart';
import 'package:doctor_hunt/widgets/title_onboarding_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              children: [
                SizedBox(height: 127),

                TitleOnboardingWidget(title: 'Welcome back'),
                SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: DescriptionOnboardingWidget(
                    description:
                        'You can search c ourse, apply course and find scholarship for abroad studies',
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
                SizedBox(height: 37),

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
                SizedBox(height: 32),

                GetStartedButton(title: 'Login', onTap: () {}),
                SizedBox(height: 19),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        final PageController pageController = PageController();
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Container(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsetsGeometry.only(
                                  top: 20,
                                  right: 20,
                                  left: 20,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        'assets/images/Rectangle 539.png',
                                      ),
                                    ),
                                    SizedBox(height: 55),
                                    SizedBox(
                                      height: 190,
                                      child: PageView(
                                        controller: pageController,
                                        physics: NeverScrollableScrollPhysics(),
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const TitleOnboardingWidget(
                                                title: 'Forgot password',
                                              ),
                                              const SizedBox(height: 12),
                                              const Text(
                                                'Enter your email for the verification process, we will send 4 digits code to your email.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.blue,
                                                ),
                                              ),
                                              const SizedBox(height: 36),
                                              CustomTextField(
                                                controller: email,
                                                isPassword: false,
                                                hintText: 'Email',
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const TitleOnboardingWidget(
                                                title: 'Enter 4 Digits Code',
                                              ),
                                              const SizedBox(height: 12),
                                              const Text(
                                                'Enter the 4 digits code that you received on your email.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.blue,
                                                ),
                                              ),
                                              const SizedBox(height: 36),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: List.generate(
                                                  4,
                                                  (index) => Container(
                                                    width: 50,
                                                    height: 55,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors
                                                            .grey
                                                            .shade300,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                    ),
                                                    child: const Center(
                                                      child: TextField(
                                                        textAlign:
                                                            TextAlign.center,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        maxLength: 1,
                                                        decoration:
                                                            InputDecoration(
                                                              counterText: "",
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: GetStartedButton(
                                        title: 'Continue',
                                        onTap: () {
                                          if (pageController.page == 0) {
                                            pageController.animateToPage(
                                              1,
                                              duration: const Duration(
                                                milliseconds: 300,
                                              ),
                                              curve: Curves.easeInOut,
                                            );
                                          } else {
                                            //otp code
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 50),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Text(
                    'Forget password',
                    style: TextStyle(
                      color: Color(0xFF0EBE7F),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 123),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            color: Color(0xFF0EBE7F),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignupScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Join us',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
