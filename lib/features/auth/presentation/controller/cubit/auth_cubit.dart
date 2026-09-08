import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/features/auth/data/auth_repo.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitialState());
  UserModel? currentUser;

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String userType,
  }) async {
    emit(AuthLoadingState());
    try {
      currentUser = await _authRepository.signUp(
        email: email,
        password: password,
        name: name,
        userType: userType,
      );

      emit(AuthSignedUp());
    } on FirebaseAuthException catch (e) {
      emit(
        AuthFailureState(errorMessage: e.message ?? "Authentication failed"),
      );
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());

    try {
      currentUser = await _authRepository.signIn(
        email: email,
        password: password,
      );

      emit(AuthUserLoaded(userModel: currentUser!));
    } on FirebaseAuthException catch (e) {
      print(e.message);

      emit(AuthFailureState(errorMessage: e.message ?? "Login failed"));
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }
}
