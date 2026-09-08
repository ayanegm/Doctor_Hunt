import 'package:doctor_hunt/core/router/app_routes.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/auth/presentation/screens/choose_role_page.dart';
import 'package:doctor_hunt/features/auth/presentation/screens/login_page.dart';
import 'package:doctor_hunt/features/auth/presentation/screens/signup_screen.dart';
import 'package:doctor_hunt/features/booking_appointment/presentation/screens/doctor_appointment_screen_01.dart';
import 'package:doctor_hunt/features/booking_appointment/presentation/screens/doctor_appointment_screen_02.dart';
import 'package:doctor_hunt/features/doctor_details/presentation/screens/doctor_details_screen.dart';
import 'package:doctor_hunt/features/find_doctors/presentation/screens/find_doctor_page.dart';
import 'package:doctor_hunt/features/find_doctors/presentation/widgets/find_doctor_card.dart';
import 'package:doctor_hunt/features/home/presentation/screens/home_page.dart';
import 'package:doctor_hunt/features/onboarding/onboarding_page_01.dart';
import 'package:doctor_hunt/features/onboarding/onboarding_page_02.dart';
import 'package:doctor_hunt/features/onboarding/onboarding_page_03.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
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
    ],
  );
}
