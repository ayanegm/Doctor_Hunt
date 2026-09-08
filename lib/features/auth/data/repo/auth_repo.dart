import 'package:doctor_hunt/features/auth/data/auth_web_services.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final AuthFirebaseServices _authWebServices;
  AuthRepository(this._authWebServices);
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    required String userType,
  }) async {
    UserCredential credential = await _authWebServices.createUserWithEmail(
      email: email,
      password: password,
    );
    String uid = credential.user!.uid;
    UserModel userModel = UserModel(
      uid: uid,
      userType: userType,
      name: name,
      email: email,
    );
    await _authWebServices.saveUserData(
      uid: uid,
      userData: userModel.toJson(),
      userType: userType,
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
}
