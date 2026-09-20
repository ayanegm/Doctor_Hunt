import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/core/services/cloudinary_service.dart';
import 'package:doctor_hunt/features/doctors/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/admin/data/service/admin_service.dart';

class AdminRepository {
  final AdminService _adminService;

  AdminRepository({required AdminService adminService})
    : _adminService = adminService;
  Future<void> createDoctor({
    required String name,
    required String speciality,
    required File? imageFile,
  }) async {
    String uniqueId = FirebaseFirestore.instance.collection('doctors').doc().id;
    String? imageUrl;
    if (imageFile != null) {
      imageUrl = await CloudinaryService.uploadImage(imageFile);
      print('Cloudinary uploaded URL: $imageUrl');
    } else {
      print('ImageFile is NULL in repository!');
    }
    DoctorModel doctorModel = DoctorModel(
      id: uniqueId,
      name: name,
      speciality: speciality,
      imageUrl: imageUrl ?? '',
    );
    await _adminService.addDocotr(doctorModel);
  }

  Future<QuerySnapshot> getAllDoctors() async {
    return await _adminService.getAllDoctors();
  }

  Future<void> updateDoctor(DoctorModel doctorModel) async {
    await _adminService.updateDoctor(doctorModel);
  }
}
