import 'package:doctor_hunt/features/auth/data/models/user_model.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSignedUp extends AuthState {}

class AuthUserLoaded extends AuthState {
  final UserModel userModel;
  AuthUserLoaded({required this.userModel});
}

class AuthFailureState extends AuthState {
  final String errorMessage;
  AuthFailureState({required this.errorMessage});
}
