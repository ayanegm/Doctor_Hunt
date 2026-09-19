part of 'admin_cubit.dart';

abstract class AdminState {}

final class AdminInitialState extends AdminState {}

final class AdminLoadingState extends AdminState {}

final class AdminSuccessState extends AdminState {}

final class AdminFailureState extends AdminState {
  final String errorMessage;
  AdminFailureState({required this.errorMessage});
}

final class DoctorsSuccessState extends AdminState {
  final List<DoctorModel> doctorsList;

  DoctorsSuccessState({required this.doctorsList});
}
