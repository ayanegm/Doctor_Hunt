import 'dart:convert';

import 'package:doctor_hunt/cache/cache_helper.dart';
import 'package:doctor_hunt/core/models/user_model.dart';
import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/dependancy_injection.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/admin_details_row.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/logout_button.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/switch_button.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/cubit/auth_state.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:doctor_hunt/widgets/admin_custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AdminSettingPage extends StatefulWidget {
  const AdminSettingPage({super.key});

  @override
  State<AdminSettingPage> createState() => _AdminSettingPageState();
}

class _AdminSettingPageState extends State<AdminSettingPage> {
  @override
  Widget build(BuildContext context) {
    final String? userJsonString = CacheData.getData(key: 'cached_user');
    if (userJsonString == null) {
      return const Scaffold(
        body: Center(child: Text('No user data found. Please log in again.')),
      );
    }
    final Map<String, dynamic> userMap = jsonDecode(userJsonString);
    final UserModel userModel = UserModel.fromJson(userMap);
    return AdminCustomScaffold(
      body: Column(
        children: [
          AdminDetailsRow(
            title: userModel.name,
            value: userModel.email,
            adminPhoto: userModel.imageUrl,
          ),
          SizedBox(height: 24.h),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            color: Colors.white,
            child: Column(
              children: [
                AdminDetailsRow(
                  title: 'Admin Profile',
                  value: 'Edit super admin details & permissions',
                  isSettingsRow: true,
                ),
                SizedBox(height: 5.h),
                AdminDetailsRow(
                  title: 'Change Password',
                  value: 'Update master security credentials',
                  isSettingsRow: true,
                ),
                SizedBox(height: 5.h),
                AdminDetailsRow(
                  title: 'Notification Preferences',
                  value: 'Clinical alerts & system broadcasts',
                  isSettingsRow: true,
                ),
                SizedBox(height: 5.h),
                AdminDetailsRow(
                  title: 'App Information',
                  value: 'Build version ',
                  isSettingsRow: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),

          // Logout Bloc Section
          BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoggedOutSuccessState) {
                  context.go('/login');
                } else if (state is AuthFailureState) {
                  SnackBar(content: Text(state.errorMessage));
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(color: AppColor.red),
                    ),
                  );
                }
                return LogoutButton(
                  onTap: () {
                    context.read<AuthCubit>().userLogout();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
