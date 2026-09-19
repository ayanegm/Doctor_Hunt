import 'package:doctor_hunt/cache/cache_helper.dart';
import 'package:doctor_hunt/core/models/user_type_enum.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/widgets/custom_scaffold.dart';
import 'package:doctor_hunt/features/auth/presentation/screens/signup_screen.dart';
import 'package:doctor_hunt/features/choose_role/presentation/widgets/role_type_container.dart';
import 'package:doctor_hunt/features/onboarding/widgets/description_text_widget.dart';
import 'package:doctor_hunt/features/onboarding/widgets/get_started_button.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseRolePage extends StatefulWidget {
  const ChooseRolePage({super.key});

  @override
  State<ChooseRolePage> createState() => _ChooseRolePageState();
}

class _ChooseRolePageState extends State<ChooseRolePage> {
  UserType selectedRole = UserType.patient;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 80.h),

            Text(
              AppStrings.chooseRolePageTitle,
              style: TextStyles.onBoardingTitle,
            ),
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
              isSelected: selectedRole == UserType.patient,
              iconPath: Assets.patientIcon,
              onTap: () {
                setState(() {
                  selectedRole = UserType.patient;
                });
              },
            ),
            SizedBox(height: 16.h),
            RoleTypeContainer(
              title: 'Admin',
              description:
                  'Manage doctors, appointments, users, and the platform.',
              isSelected: selectedRole == UserType.admin,
              iconPath: Assets.patientIcon,
              onTap: () {
                setState(() {
                  selectedRole = UserType.admin;
                });
              },
            ),
            SizedBox(height: 50.h),
            GetStartedButton(
              title: 'Continue',
              onTap: () {
                CacheData.setData(
                  key: 'userData',
                  value: selectedRole.nameValue,
                );
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
