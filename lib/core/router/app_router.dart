import 'package:doctor_hunt/core/router/app_routes.dart';
import 'package:doctor_hunt/core/models/user_model.dart';
import 'package:doctor_hunt/features/admin/presentation/screens/admin_setting_page.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/admin_bottom_nav_bar.dart';
import 'package:doctor_hunt/features/doctors/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/admin/presentation/screens/create_doctor_screen.dart';
import 'package:doctor_hunt/features/admin/presentation/screens/doctor_details_page.dart';
import 'package:doctor_hunt/features/admin/presentation/screens/doctor_list_screen.dart';
import 'package:doctor_hunt/features/admin/presentation/screens/edit_admin_profile_screen.dart';
import 'package:doctor_hunt/features/admin/presentation/screens/edit_doctor_screen.dart';
import 'package:doctor_hunt/features/auth/presentation/screens/login_screen.dart';
import 'package:doctor_hunt/features/choose_role/presentation/screens/choose_role_page.dart';
import 'package:doctor_hunt/features/auth/presentation/screens/signup_screen.dart';
import 'package:doctor_hunt/features/booking_appointment/presentation/screens/doctor_appointment_screen_01.dart';
import 'package:doctor_hunt/features/booking_appointment/presentation/screens/doctor_appointment_screen_02.dart';
import 'package:doctor_hunt/features/doctor_details/presentation/screens/doctor_details_screen.dart';
import 'package:doctor_hunt/features/favorite_apge.dart';
import 'package:doctor_hunt/features/find_doctors/presentation/screens/find_doctor_screen.dart';
import 'package:doctor_hunt/features/home/presentation/screens/home_page.dart';
import 'package:doctor_hunt/features/onboarding/onboarding_page_01.dart';
import 'package:doctor_hunt/features/onboarding/onboarding_page_02.dart';
import 'package:doctor_hunt/features/onboarding/onboarding_page_03.dart';
import 'package:doctor_hunt/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: AdminBottomNavBar(
              navigationShell: navigationShell,
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes
                    .doctorListPage, // or whatever your admin main tab is
                builder: (context, state) => DoctorListPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.adminSettingPage,
                builder: (context, state) {
                  final userModel = state.extra as UserModel?;
                  return AdminSettingPage(userModel: userModel!);
                },
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: BottomNavBar(navigationShell: navigationShell),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.homePage,
                builder: (context, state) {
                  final userModel = state.extra as UserModel?;
                  return HomePage(userModel: userModel);
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorites',
                builder: (context, state) => const FavoriteApge(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorites',
                builder: (context, state) => const FavoriteApge(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorites',
                builder: (context, state) => const FavoriteApge(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.adminSettingPage,
        builder: (context, state) {
          final userModel = state.extra as UserModel?;
          return AdminSettingPage(userModel: userModel!);
        },
      ),
      GoRoute(
        path: AppRoutes.doctorDetailsPage,
        builder: (context, state) => DoctorDetailsPage(),
      ),
      GoRoute(
        path: AppRoutes.editAdminProfileScreen,
        builder: (context, state) => EditAdminProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.doctorAppointmentScreen02,
        builder: (context, state) => DoctorAppointmentScreen02(),
      ),
      GoRoute(
        path: AppRoutes.doctorAppointmentScreen01,
        builder: (context, state) => DoctorAppointmentScreen01(),
      ),
      GoRoute(
        path: AppRoutes.doctorDetailsScreen,
        builder: (context, state) => DoctorDetailsScreen(),
      ),
      GoRoute(
        path: AppRoutes.findDoctorPage,
        builder: (context, state) => FindDoctorPage(),
      ),
      GoRoute(
        path: AppRoutes.homePage,
        builder: (context, state) {
          final userModel = state.extra as UserModel?;
          return HomePage(userModel: userModel);
        },
      ),
      GoRoute(
        path: AppRoutes.onboarding01,
        builder: (context, state) => const OnboardingPage01(),
      ),
      GoRoute(
        path: AppRoutes.onboarding02,
        builder: (context, state) => const OnboardingPage02(),
      ),
      GoRoute(
        path: AppRoutes.onboarding03,
        builder: (context, state) => const OnboardingPage03(),
      ),
      GoRoute(path: AppRoutes.login, builder: (context, state) => LoginPage()),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => SignupScreen(),
      ),
      GoRoute(
        path: AppRoutes.chooseRolePage,
        builder: (context, state) => ChooseRolePage(),
      ),
      GoRoute(
        path: AppRoutes.doctorListPage,
        builder: (context, state) => DoctorListPage(),
      ),
      GoRoute(
        path: AppRoutes.editDoctorScreen,
        builder: (context, state) {
          final doctorModel = state.extra as DoctorModel?;
          return EditDoctorScreen(doctorModel: doctorModel!);
        },
      ),
      GoRoute(
        path: AppRoutes.createDoctorScreen,
        builder: (context, state) => CreateDoctorScreen(),
      ),
    ],
  );
}
