import 'dart:io';

import 'package:doctor_hunt/core/models/user_type_enum.dart';
import 'package:doctor_hunt/core/services/cloudinary_service.dart';
import 'package:doctor_hunt/features/auth/data/service/auth_services.dart';
import 'package:doctor_hunt/core/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final AuthFirebaseServices _authWebServices;
  AuthRepository(this._authWebServices);
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    required UserType userType,
    File? imageFile,
  }) async {
    UserCredential credential = await _authWebServices.createUserWithEmail(
      email: email,
      password: password,
    );
    String uid = credential.user!.uid;
    String? imageUrl;
    if (imageFile != null) {
      imageUrl = await CloudinaryService.uploadImage(imageFile);
      print('Cloudinary uploaded URL: $imageUrl');
    } else {
      print('ImageFile is NULL in repository!');
    }
    UserModel userModel = UserModel(
      uid: uid,
      userType: userType,
      name: name,
      email: email,
      imageUrl: imageUrl,
    );
    await _authWebServices.saveUserData(
      uid: uid,
      userData: userModel.toJson(),
      userType: userType.nameValue,
    );
    return userModel;
  }

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await _authWebServices.signInUserWithEmail(
      email: email,
      password: password,
    );
    String uid = credential.user!.uid;
    Map<String, dynamic>? userData = await _authWebServices.getUserModel(
      uid: uid,
    );
    if (userData == null) {
      throw Exception("User data not found in database");
    }
    return UserModel.fromJson(userData);
  }

  Future<void> logout() async {
    try {
      await _authWebServices.logout();
    } catch (e) {
      throw Exception('Failed to logout $e');
    }
  }

  Future<void> forgetPassword({required String email}) async {
    await _authWebServices.forgetPassword(email);
  }
}
