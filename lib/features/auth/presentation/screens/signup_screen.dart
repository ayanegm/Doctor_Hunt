import 'package:doctor_hunt/core/models/user_type_enum.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/dependancy_injection.dart';
import 'package:doctor_hunt/features/auth/presentation/screens/login_screen.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:doctor_hunt/widgets/custom_scaffold.dart';
import 'package:doctor_hunt/features/auth/data/repo/auth_repo.dart';
import 'package:doctor_hunt/features/auth/data/service/auth_services.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/cubit/auth_state.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/auth_controllers.dart';
import 'package:doctor_hunt/widgets/custom_text_field.dart';
import 'package:doctor_hunt/features/onboarding/widgets/description_text_widget.dart';
import 'package:doctor_hunt/features/onboarding/widgets/get_started_button.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/registeration_widges_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key, this.userType});
  final AuthControllers controller = AuthControllers();
  final UserType? userType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
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
            body: Padding(
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
                          Text(
                            AppStrings.signUpTitle,
                            style: TextStyles.onBoardingTitle,
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
                          imageLink: Assets.googleImage,
                        ),
                        SizedBox(width: 15.w),
                        RegisterationWidgesType(
                          title: 'Facebook',
                          onTap: () {},
                          imageLink: Assets.faceBookImage,
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
                                  userType: userType!,
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
                            color: AppColor.green,
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
                              color: AppColor.green,
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
          );
        },
      ),
    );
  }
}
