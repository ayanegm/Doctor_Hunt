import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/cache/cache_helper.dart';
import 'package:doctor_hunt/core/models/user_model.dart';
import 'package:doctor_hunt/core/models/user_type_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<UserCredential> createUserWithEmail({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> saveUserData({
    required String uid,
    required Map<String, dynamic> userData,
    required String userType,
  }) async {
    String collectionName = (userType.toLowerCase() == 'admin')
        ? 'admins'
        : 'patients';
    await _firestore.collection(collectionName).doc(uid).set(userData);
  }

  Future<UserCredential> signInUserWithEmail({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<Map<String, dynamic>?> getUserModel({required String uid}) async {
    String roleString = CacheData.getData(key: 'userData') ?? '';
    UserType userRole = UserType.fromString(roleString);
    DocumentSnapshot? doc;
    if (userRole == UserType.patient) {
      doc = await _firestore.collection('patients').doc(uid).get();
    } else {
      doc = await _firestore.collection('admins').doc(uid).get();
    }
    if (doc.exists && doc.data() != null) {
      return doc.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> forgetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
