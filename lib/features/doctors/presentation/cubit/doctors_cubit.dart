import 'package:doctor_hunt/features/admin/data/repo/admin_repository.dart';
import 'package:doctor_hunt/features/admin/presentation/controllers/cubit/admin_cubit.dart';
import 'package:doctor_hunt/features/doctors/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/doctors/presentation/cubit/doctors_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  final AdminRepository adminRepository;

  DoctorsCubit(this.adminRepository) : super(DoctorInitial());

  void getAllDoctors() async {
    emit(DoctorInitial());
    try {
      final querySnapshot = await adminRepository.getAllDoctors();
      final List<DoctorModel> doctors = querySnapshot.docs.map((doc) {
        return DoctorModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      emit(DoctorSuccess(doctorsList: doctors));
    } catch (e) {
      emit(DoctorFailure(errorMessage: e.toString()));
    }
  }
}
