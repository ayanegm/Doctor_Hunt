import 'package:doctor_hunt/features/doctors/data/models/doctor_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/features/admin/data/repo/admin_repository.dart';

abstract class DoctorsState {}

class DoctorInitial extends DoctorsState {}

class DcotorLoading extends DoctorsState {}

class DoctorSuccess extends DoctorsState {
  final List<DoctorModel> doctorsList;
  DoctorSuccess({required this.doctorsList});
}

class DoctorFailure extends DoctorsState {
  final String errorMessage;
  DoctorFailure({required this.errorMessage});
}
