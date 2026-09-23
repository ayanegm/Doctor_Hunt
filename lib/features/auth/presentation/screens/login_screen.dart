import 'package:doctor_hunt/core/models/user_type_enum.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/dependancy_injection.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/clicked_text_widget.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/auth_controllers.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/cubit/auth_state.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/registeration_widges_type.dart';
import 'package:doctor_hunt/features/choose_role/presentation/screens/choose_role_page.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:doctor_hunt/widgets/custom_scaffold.dart';
import 'package:doctor_hunt/widgets/custom_text_field.dart';
import 'package:doctor_hunt/features/common/onboarding/widgets/description_text_widget.dart';
import 'package:doctor_hunt/features/common/onboarding/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:doctor_hunt/core/router/app_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final AuthControllers controller = AuthControllers();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: CustomScaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthUserLoaded) {
              final userMdoel = state.userModel;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (userMdoel.userType == UserType.admin) {
                  context.go('/adminSettingPage');
                  return;
                }
                context.go('/homePage');
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

                        Text(
                          AppStrings.welcomeBack,
                          style: TextStyles.onBoardingTitle,
                        ),
                        SizedBox(height: 15.h),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26),
                          child: DescriptionTextWidget(
                            description: AppStrings.onBaocrdingDescribtion,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RegisterationWidgesType(
                                title: AppStrings.google,
                                onTap: () {},
                                imageLink: Assets.googleImage,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: RegisterationWidgesType(
                                title: 'Facebook',
                                onTap: () {},
                                imageLink: Assets.faceBookImage,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 37.h),

                        CustomTextField(
                          controller: controller.email,
                          isPassword: false,
                          hintText: AppStrings.email,
                        ),
                        SizedBox(height: 18.h),
                        CustomTextField(
                          controller: controller.password,
                          isPassword: true,
                          hintText: AppStrings.password,
                        ),
                        SizedBox(height: 32),

                        GetStartedButton(
                          title: isLoading
                              ? '${AppStrings.loading}...'
                              : AppStrings.login,
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
                        ClickedTextWidget(
                          text: 'Forget Password',
                          onTap: () {
                            _showForgotPasswordBottomSheet(context);
                          },
                          textColor: AppColor.green,
                        ),
                        SizedBox(height: 40.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppStrings.haveAccount,
                                  style: TextStyles.joinUs,
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
                                    AppStrings.joinUs,
                                    style: TextStyles.joinUs,
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

  void _showForgotPasswordBottomSheet(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // لكي يتفاعل مع ظهور لوحة المفاتيح (Keyboard) بشكل صحيح
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4..h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.h),

                Text(
                  'Enter your email address below and we will send you a link to reset your password.',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                ),
                SizedBox(height: 24.h),

                CustomTextField(
                  controller: emailController,
                  isPassword: false,
                  hintText: 'Enter your email',
                ),
                SizedBox(height: 24.h),

                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      final email = emailController.text.trim();
                      if (email.isNotEmpty) {
                        context.read<AuthCubit>().ForgetPassword(email: email);

                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Password reset link sent to your email!',
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Send Reset Link',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
