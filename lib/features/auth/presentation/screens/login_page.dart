import 'package:doctor_hunt/core/router/app_routes.dart';
import 'package:doctor_hunt/custom_scaffold.dart';
import 'package:doctor_hunt/features/auth/data/auth_repo.dart';
import 'package:doctor_hunt/features/auth/data/auth_web_services.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/cubit/auth_state.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/auth_controllers.dart';
import 'package:doctor_hunt/features/auth/presentation/screens/choose_role_page.dart';
import 'package:doctor_hunt/widgets/custom_text_field.dart';
import 'package:doctor_hunt/features/onboarding/widgets/description_text_widget.dart';
import 'package:doctor_hunt/features/onboarding/widgets/get_started_button.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/registeration_widges_type.dart';
import 'package:doctor_hunt/widgets/title_onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final AuthControllers controller = AuthControllers();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepository(AuthFirebaseServices())),
      child: CustomScaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthUserLoaded) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go(AppRoutes.homePage, extra: state.userModel);
              });
            }

            if (state is AuthFailureState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            bool isLoading = state is AuthLoadingState;

            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 80.h),

                        TitleOnboardingWidget(title: 'Welcome back'),
                        SizedBox(height: 15.h),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26),
                          child: DescriptionTextWidget(
                            description:
                                'You can search course, apply course and find scholarship for abroad studies',
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RegisterationWidgesType(
                                title: 'Google',
                                onTap: () {},
                                imageLink: 'assets/images/Group.png',
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: RegisterationWidgesType(
                                title: 'Facebook',
                                onTap: () {},
                                imageLink: 'assets/images/Group (1).png',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 37.h),

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
                        SizedBox(height: 32),

                        GetStartedButton(
                          title: isLoading ? 'Loading...' : 'Login',
                          onTap: isLoading
                              ? () {}
                              : () async {
                                  BlocProvider.of<AuthCubit>(
                                    context,
                                  ).signInWithEmailAndPassword(
                                    email: controller.email.text.trim(),
                                    password: controller.password.text.trim(),
                                  );
                                },
                        ),
                        SizedBox(height: 19.h),

                        SizedBox(height: 40.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Don’t have an account?',
                                  style: TextStyle(
                                    color: const Color(0xFF0EBE7F),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ChooseRolePage();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Join us',
                                    style: TextStyle(
                                      color: const Color(0xFF0EBE7F),
                                      fontSize: 14.sp,
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
                ),

                if (isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
