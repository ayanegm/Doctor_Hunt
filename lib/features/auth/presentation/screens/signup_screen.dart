import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/custom_scaffold.dart';
import 'package:doctor_hunt/features/auth/data/auth_repo.dart';
import 'package:doctor_hunt/features/auth/data/auth_web_services.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/cubit/auth_state.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/auth_controllers.dart';
import 'package:doctor_hunt/features/auth/presentation/screens/login_page.dart';
import 'package:doctor_hunt/widgets/custom_text_field.dart';
import 'package:doctor_hunt/features/onboarding/widgets/description_text_widget.dart';
import 'package:doctor_hunt/features/onboarding/widgets/get_started_button.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/registeration_widges_type.dart';
import 'package:doctor_hunt/widgets/title_onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key, this.userType = ''});
  final AuthControllers controller = AuthControllers();
  final String userType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepository(AuthFirebaseServices())),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSignedUp) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          } else if (state is AuthFailureState) {
            // Show error message
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return CustomScaffold(
            body: Stack(
              children: [
                Positioned(
                  bottom: -7.h,
                  right: -10.w,
                  child: Image.asset(
                    'assets/images/bg.png',
                    height: 216.h,
                    width: 216.w,
                  ),
                ),
                Positioned(
                  top: -18.h,
                  left: -18.w,
                  child: Image.asset(
                    'assets/images/Ellipse 142.png',
                    height: 216.h,
                    width: 216.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 90.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                          child: Column(
                            children: [
                              TitleOnboardingWidget(
                                title: 'Join us to start searching',
                              ),
                              SizedBox(height: 15.h),
                              DescriptionTextWidget(
                                description:
                                    'You can search course, apply course and find scholarship for abroad studies',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RegisterationWidgesType(
                              title: 'Google',
                              onTap: () {},
                              imageLink: 'assets/images/Group.png',
                            ),
                            SizedBox(width: 15.w),
                            RegisterationWidgesType(
                              title: 'Facebook',
                              onTap: () {},
                              imageLink: 'assets/images/Group (1).png',
                            ),
                          ],
                        ),
                        SizedBox(height: 34.h),
                        CustomTextField(
                          controller: controller.name,
                          isPassword: false,
                          hintText: 'Name',
                        ),
                        SizedBox(height: 18.h),
                        CustomTextField(
                          controller: controller.email,
                          isPassword: false,
                          hintText: 'Email',
                        ),
                        SizedBox(height: 18.h),
                        CustomTextField(
                          controller: controller.password,
                          isPassword: true,
                          hintText: 'Password',
                        ),
                        SizedBox(height: 14.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/Ellipse 163.png',
                              height: 16.h,
                              width: 16.w,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'I agree with the Terms of Service & Privacy Policy',
                              style: TextStyle(
                                color: AppColor.blue,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Center(
                          child: state is AuthLoadingState
                              ? const CircularProgressIndicator()
                              : GetStartedButton(
                                  title: 'sign up',
                                  onTap: () {
                                    BlocProvider.of<AuthCubit>(
                                      context,
                                    ).signUpWithEmailAndPassword(
                                      email: controller.email.text.trim(),
                                      password: controller.password.text.trim(),
                                      name: controller.name.text.trim(),
                                      userType: userType,
                                    );
                                  },
                                ),
                        ),
                        SizedBox(height: 17.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Have an account?',
                              style: TextStyle(
                                color: Color(0xFF0EBE7F),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 5.w),
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
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
