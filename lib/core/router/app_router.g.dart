// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $adminShellRouteData,
  $userShellRouteData,
  $loginRoute,
  $signupRoute,
  $chooseRolePageRoute,
  $onboarding01Route,
  $onboarding02Route,
  $onboarding03Route,
  $findDoctorPageRoute,
  $doctorDetailsScreenRoute,
  $doctorAppointment01Route,
  $doctorAppointment02Route,
  $editDoctorScreenRoute,
  $createDoctorScreenRoute,
  $doctorDetailsPageRoute,
  $editAdminProfileScreenRoute,
];

RouteBase get $adminShellRouteData => StatefulShellRouteData.$route(
  factory: $AdminShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/DoctorListPage',

          factory: $DoctorListPageRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/adminSettingPage',

          factory: $AdminSettingPageRouteExtension._fromState,
        ),
      ],
    ),
  ],
);

extension $AdminShellRouteDataExtension on AdminShellRouteData {
  static AdminShellRouteData _fromState(GoRouterState state) =>
      const AdminShellRouteData();
}

extension $DoctorListPageRouteExtension on DoctorListPageRoute {
  static DoctorListPageRoute _fromState(GoRouterState state) =>
      const DoctorListPageRoute();

  String get location => GoRouteData.$location('/DoctorListPage');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AdminSettingPageRouteExtension on AdminSettingPageRoute {
  static AdminSettingPageRoute _fromState(GoRouterState state) =>
      const AdminSettingPageRoute();

  String get location => GoRouteData.$location('/adminSettingPage');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userShellRouteData => StatefulShellRouteData.$route(
  factory: $UserShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/homePage',

          factory: $HomePageRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/favorites',

          factory: $FavoritePageRouteExtension._fromState,
        ),
      ],
    ),
  ],
);

extension $UserShellRouteDataExtension on UserShellRouteData {
  static UserShellRouteData _fromState(GoRouterState state) =>
      const UserShellRouteData();
}

extension $HomePageRouteExtension on HomePageRoute {
  static HomePageRoute _fromState(GoRouterState state) => const HomePageRoute();

  String get location => GoRouteData.$location('/homePage');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FavoritePageRouteExtension on FavoritePageRoute {
  static FavoritePageRoute _fromState(GoRouterState state) =>
      const FavoritePageRoute();

  String get location => GoRouteData.$location('/favorites');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',

  factory: $LoginRouteExtension._fromState,
);

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location('/login');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signupRoute => GoRouteData.$route(
  path: '/signup',

  factory: $SignupRouteExtension._fromState,
);

extension $SignupRouteExtension on SignupRoute {
  static SignupRoute _fromState(GoRouterState state) => const SignupRoute();

  String get location => GoRouteData.$location('/signup');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $chooseRolePageRoute => GoRouteData.$route(
  path: '/chooseRolePage',

  factory: $ChooseRolePageRouteExtension._fromState,
);

extension $ChooseRolePageRouteExtension on ChooseRolePageRoute {
  static ChooseRolePageRoute _fromState(GoRouterState state) =>
      const ChooseRolePageRoute();

  String get location => GoRouteData.$location('/chooseRolePage');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onboarding01Route => GoRouteData.$route(
  path: '/onboarding_page_01',

  factory: $Onboarding01RouteExtension._fromState,
);

extension $Onboarding01RouteExtension on Onboarding01Route {
  static Onboarding01Route _fromState(GoRouterState state) =>
      const Onboarding01Route();

  String get location => GoRouteData.$location('/onboarding_page_01');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onboarding02Route => GoRouteData.$route(
  path: '/onboarding_page_02',

  factory: $Onboarding02RouteExtension._fromState,
);

extension $Onboarding02RouteExtension on Onboarding02Route {
  static Onboarding02Route _fromState(GoRouterState state) =>
      const Onboarding02Route();

  String get location => GoRouteData.$location('/onboarding_page_02');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onboarding03Route => GoRouteData.$route(
  path: '/onboarding_page_03',

  factory: $Onboarding03RouteExtension._fromState,
);

extension $Onboarding03RouteExtension on Onboarding03Route {
  static Onboarding03Route _fromState(GoRouterState state) =>
      const Onboarding03Route();

  String get location => GoRouteData.$location('/onboarding_page_03');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $findDoctorPageRoute => GoRouteData.$route(
  path: '/findDoctorPage',

  factory: $FindDoctorPageRouteExtension._fromState,
);

extension $FindDoctorPageRouteExtension on FindDoctorPageRoute {
  static FindDoctorPageRoute _fromState(GoRouterState state) =>
      const FindDoctorPageRoute();

  String get location => GoRouteData.$location('/findDoctorPage');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $doctorDetailsScreenRoute => GoRouteData.$route(
  path: '/doctorDetailsScreen',

  factory: $DoctorDetailsScreenRouteExtension._fromState,
);

extension $DoctorDetailsScreenRouteExtension on DoctorDetailsScreenRoute {
  static DoctorDetailsScreenRoute _fromState(GoRouterState state) =>
      const DoctorDetailsScreenRoute();

  String get location => GoRouteData.$location('/doctorDetailsScreen');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $doctorAppointment01Route => GoRouteData.$route(
  path: '/DoctorAppointmentScreen01',

  factory: $DoctorAppointment01RouteExtension._fromState,
);

extension $DoctorAppointment01RouteExtension on DoctorAppointment01Route {
  static DoctorAppointment01Route _fromState(GoRouterState state) =>
      const DoctorAppointment01Route();

  String get location => GoRouteData.$location('/DoctorAppointmentScreen01');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $doctorAppointment02Route => GoRouteData.$route(
  path: '/doctorAppointmentScreen02',

  factory: $DoctorAppointment02RouteExtension._fromState,
);

extension $DoctorAppointment02RouteExtension on DoctorAppointment02Route {
  static DoctorAppointment02Route _fromState(GoRouterState state) =>
      const DoctorAppointment02Route();

  String get location => GoRouteData.$location('/doctorAppointmentScreen02');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editDoctorScreenRoute => GoRouteData.$route(
  path: '/EditDoctorScreen',

  factory: $EditDoctorScreenRouteExtension._fromState,
);

extension $EditDoctorScreenRouteExtension on EditDoctorScreenRoute {
  static EditDoctorScreenRoute _fromState(GoRouterState state) =>
      const EditDoctorScreenRoute();

  String get location => GoRouteData.$location('/EditDoctorScreen');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $createDoctorScreenRoute => GoRouteData.$route(
  path: '/CreateDoctorScreen',

  factory: $CreateDoctorScreenRouteExtension._fromState,
);

extension $CreateDoctorScreenRouteExtension on CreateDoctorScreenRoute {
  static CreateDoctorScreenRoute _fromState(GoRouterState state) =>
      const CreateDoctorScreenRoute();

  String get location => GoRouteData.$location('/CreateDoctorScreen');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $doctorDetailsPageRoute => GoRouteData.$route(
  path: '/DoctorDetailsPage',

  factory: $DoctorDetailsPageRouteExtension._fromState,
);

extension $DoctorDetailsPageRouteExtension on DoctorDetailsPageRoute {
  static DoctorDetailsPageRoute _fromState(GoRouterState state) =>
      const DoctorDetailsPageRoute();

  String get location => GoRouteData.$location('/DoctorDetailsPage');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editAdminProfileScreenRoute => GoRouteData.$route(
  path: '/EditAdminProfileScreen',

  factory: $EditAdminProfileScreenRouteExtension._fromState,
);

extension $EditAdminProfileScreenRouteExtension on EditAdminProfileScreenRoute {
  static EditAdminProfileScreenRoute _fromState(GoRouterState state) =>
      const EditAdminProfileScreenRoute();

  String get location => GoRouteData.$location('/EditAdminProfileScreen');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
