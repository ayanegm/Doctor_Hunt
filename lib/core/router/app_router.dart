import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:doctor_hunt/features/admin/presentation/screens/admin_setting_page.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/admin_bottom_nav_bar.dart';
import 'package:doctor_hunt/features/auth/presentation/screens/login_screen.dart';
import 'package:doctor_hunt/features/choose_role/presentation/screens/choose_role_page.dart';
import 'package:doctor_hunt/features/admin/presentation/screens/create_doctor_screen.dart';
import 'package:doctor_hunt/features/admin/presentation/screens/doctor_details_page.dart';
import 'package:doctor_hunt/features/admin/presentation/screens/doctor_list_screen.dart';
import 'package:doctor_hunt/features/admin/presentation/screens/edit_admin_profile_screen.dart';
import 'package:doctor_hunt/features/admin/presentation/screens/edit_doctor_screen.dart';
import 'package:doctor_hunt/features/common/auth/presentation/screens/signup_screen.dart';
import 'package:doctor_hunt/features/booking_appointment/presentation/screens/doctor_appointment_screen_01.dart';
import 'package:doctor_hunt/features/booking_appointment/presentation/screens/doctor_appointment_screen_02.dart';
import 'package:doctor_hunt/features/doctor_details/presentation/screens/doctor_details_screen.dart';
import 'package:doctor_hunt/features/doctors/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/favorite_apge.dart';
import 'package:doctor_hunt/features/find_doctors/presentation/screens/find_doctor_screen.dart';
import 'package:doctor_hunt/features/common/onboarding/onboarding_page_01.dart';
import 'package:doctor_hunt/features/common/onboarding/onboarding_page_02.dart';
import 'package:doctor_hunt/features/common/onboarding/onboarding_page_03.dart';
import 'package:doctor_hunt/features/home/presentation/screens/home_page.dart';
import 'package:doctor_hunt/widgets/bottom_nav_bar.dart';

part 'app_router.g.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: $appRoutes,
  );
}

// ==================== 1. Admin Bottom Nav Shell ====================
@TypedStatefulShellRoute<AdminShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<AdminDoctorListBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<DoctorListPageRoute>(path: '/DoctorListPage'),
      ],
    ),
    TypedStatefulShellBranch<AdminSettingBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AdminSettingPageRoute>(path: '/adminSettingPage'),
      ],
    ),
  ],
)
class AdminShellRouteData extends StatefulShellRouteData {
  const AdminShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AdminBottomNavBar(navigationShell: navigationShell),
    );
  }
}

class AdminDoctorListBranch extends StatefulShellBranchData {
  const AdminDoctorListBranch();
}

class AdminSettingBranch extends StatefulShellBranchData {
  const AdminSettingBranch();
}

// ==================== 2. User Bottom Nav Shell ====================
@TypedStatefulShellRoute<UserShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HomePageRoute>(path: '/homePage'),
      ],
    ),
    TypedStatefulShellBranch<FavoritesBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<FavoritePageRoute>(path: '/favorites'),
      ],
    ),
  ],
)
class UserShellRouteData extends StatefulShellRouteData {
  const UserShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavBar(navigationShell: navigationShell),
    );
  }
}

class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();
}

class FavoritesBranch extends StatefulShellBranchData {
  const FavoritesBranch();
}

// ==================== 3. Standalone Routes ====================

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => LoginPage();
}

@TypedGoRoute<SignupRoute>(path: '/signup')
class SignupRoute extends GoRouteData {
  const SignupRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => SignupScreen();
}

@TypedGoRoute<ChooseRolePageRoute>(path: '/chooseRolePage')
class ChooseRolePageRoute extends GoRouteData {
  const ChooseRolePageRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => ChooseRolePage();
}

@TypedGoRoute<Onboarding01Route>(path: '/onboarding_page_01')
class Onboarding01Route extends GoRouteData {
  const Onboarding01Route();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnboardingPage01();
}

@TypedGoRoute<Onboarding02Route>(path: '/onboarding_page_02')
class Onboarding02Route extends GoRouteData {
  const Onboarding02Route();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnboardingPage02();
}

@TypedGoRoute<Onboarding03Route>(path: '/onboarding_page_03')
class Onboarding03Route extends GoRouteData {
  const Onboarding03Route();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnboardingPage03();
}

@TypedGoRoute<FindDoctorPageRoute>(path: '/findDoctorPage')
class FindDoctorPageRoute extends GoRouteData {
  const FindDoctorPageRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => FindDoctorPage();
}

@TypedGoRoute<DoctorDetailsScreenRoute>(path: '/doctorDetailsScreen')
class DoctorDetailsScreenRoute extends GoRouteData {
  const DoctorDetailsScreenRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DoctorDetailsScreen();
}

@TypedGoRoute<DoctorAppointment01Route>(path: '/DoctorAppointmentScreen01')
class DoctorAppointment01Route extends GoRouteData {
  const DoctorAppointment01Route();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DoctorAppointmentScreen01();
}

@TypedGoRoute<DoctorAppointment02Route>(path: '/doctorAppointmentScreen02')
class DoctorAppointment02Route extends GoRouteData {
  const DoctorAppointment02Route();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DoctorAppointmentScreen02();
}

@TypedGoRoute<EditDoctorScreenRoute>(path: '/EditDoctorScreen')
class EditDoctorScreenRoute extends GoRouteData {
  const EditDoctorScreenRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    final doctorModel = state.extra as DoctorModel?;
    return EditDoctorScreen(doctorModel: doctorModel!);
  }
}

@TypedGoRoute<CreateDoctorScreenRoute>(path: '/CreateDoctorScreen')
class CreateDoctorScreenRoute extends GoRouteData {
  const CreateDoctorScreenRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CreateDoctorScreen();
}

@TypedGoRoute<DoctorDetailsPageRoute>(path: '/DoctorDetailsPage')
class DoctorDetailsPageRoute extends GoRouteData {
  const DoctorDetailsPageRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DoctorDetailsPage();
}

@TypedGoRoute<EditAdminProfileScreenRoute>(path: '/EditAdminProfileScreen')
class EditAdminProfileScreenRoute extends GoRouteData {
  const EditAdminProfileScreenRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EditAdminProfileScreen();
}

// --- Shell Routes Classes ---

class DoctorListPageRoute extends GoRouteData {
  const DoctorListPageRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => DoctorListPage();
}

class AdminSettingPageRoute extends GoRouteData {
  const AdminSettingPageRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => AdminSettingPage();
}

class HomePageRoute extends GoRouteData {
  const HomePageRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

class FavoritePageRoute extends GoRouteData {
  const FavoritePageRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FavoriteApge();
}
