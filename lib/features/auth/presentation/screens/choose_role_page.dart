import 'package:doctor_hunt/custom_scaffold.dart';
import 'package:doctor_hunt/features/auth/presentation/screens/signup_screen.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/role_type_container.dart';
import 'package:doctor_hunt/features/onboarding/widgets/description_text_widget.dart';
import 'package:doctor_hunt/features/onboarding/widgets/get_started_button.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:doctor_hunt/widgets/title_onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseRolePage extends StatefulWidget {
  const ChooseRolePage({super.key});

  @override
  State<ChooseRolePage> createState() => _ChooseRolePageState();
}

class _ChooseRolePageState extends State<ChooseRolePage> {
  String selectedRole = 'Patient';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 80.h),

            TitleOnboardingWidget(title: 'Choose Role'),
            SizedBox(height: 15.h),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: DescriptionTextWidget(
                description:
                    'You can search c ourse, apply course and find scholarship for abroad studies',
              ),
            ),
            SizedBox(height: 40.h),
            RoleTypeContainer(
              title: 'Patient',
              description:
                  'Find doctors, book appointments, and manage your medical records.',
              isSelected: selectedRole == 'Patient',
              iconPath: Assets.patientIcon,
              onTap: () {
                setState(() {
                  selectedRole = 'Patient';
                });
              },
            ),
            SizedBox(height: 16.h),
            RoleTypeContainer(
              title: 'Admin',
              description:
                  'Manage doctors, appointments, users, and the platform.',
              isSelected: selectedRole == 'Admin',
              iconPath: Assets.patientIcon,
              onTap: () {
                setState(() {
                  selectedRole = 'Admin';
                });
              },
            ),
            SizedBox(height: 50.h),
            GetStartedButton(
              title: 'Continue',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen(userType: selectedRole);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
