import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/features/doctors/data/models/doctor_model.dart';

class AdminService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addDocotr(DoctorModel doctorModel) async {
    await _firestore
        .collection('doctors')
        .doc(doctorModel.id)
        .set(doctorModel.toJson());
  }

  Future<QuerySnapshot> getAllDoctors() async {
    return await _firestore.collection('doctors').get();
  }

  Future<void> updateDoctor(DoctorModel doctorModel) async {
    await _firestore
        .collection('doctors')
        .doc(doctorModel.id)
        .update(doctorModel.toJson());
  }
}
