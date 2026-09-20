import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/features/admin/data/repo/admin_repository.dart';
import 'package:doctor_hunt/features/doctors/data/models/doctor_model.dart';
import 'package:meta/meta.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  final AdminRepository _adminRepository;
  AdminCubit(this._adminRepository) : super(AdminInitialState());
  Future<void> createNewDoctor({
    required String name,
    required String speciality,
    required File? imageFile,
  }) async {
    emit(AdminLoadingState());
    try {
      await _adminRepository.createDoctor(
        imageFile: imageFile,
        name: name,
        speciality: speciality,
      );
      emit(AdminSuccessState());
      getAllDoctors();
    } catch (e) {
      emit(AdminFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> getAllDoctors() async {
    emit(AdminLoadingState());
    try {
      final QuerySnapshot = await _adminRepository.getAllDoctors();
      final List<DoctorModel> doctors = QuerySnapshot.docs.map((doc) {
        return DoctorModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      emit(DoctorsSuccessState(doctorsList: doctors));
    } catch (e) {
      emit(AdminFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> updateDoctor(DoctorModel doctorModel) async {
    emit(AdminLoadingState());
    try {
      await _adminRepository.updateDoctor(doctorModel);
      emit(AdminSuccessState());
      getAllDoctors();
    } catch (e) {
      emit(AdminFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> deleteDoctor(String uid) async {
    emit(AdminLoadingState());
    try {
      await _adminRepository.deleteDoctor(uid);
      emit(DoctorDeleteSuccess());
    } catch (e) {
      emit(AdminFailureState(errorMessage: e.toString()));
    }
  }
}
