import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/cache/cache_helper.dart';
import 'package:doctor_hunt/core/models/user_type_enum.dart';
import 'package:doctor_hunt/features/auth/data/repo/auth_repo.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/cubit/auth_state.dart';
import 'package:doctor_hunt/core/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitialState());
  UserModel? currentUser;

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required UserType userType,
    File? imageFile,
  }) async {
    emit(AuthLoadingState());
    try {
      currentUser = await _authRepository.signUp(
        email: email,
        password: password,
        name: name,
        userType: userType,
        imageFile: imageFile,
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
      String userJsonStirng = jsonEncode(currentUser!.toJson());
      await CacheData.setData(key: 'cached_user', value: userJsonStirng);
      emit(AuthUserLoaded(userModel: currentUser!));
    } on FirebaseAuthException catch (e) {
      print(e.message);

      emit(AuthFailureState(errorMessage: e.message ?? "Login failed"));
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> userLogout() async {
    emit(AuthLoadingState());
    try {
      await _authRepository.logout();
      emit(AuthLoggedOutSuccessState());
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> ForgetPassword({required String email}) async {
    emit(AuthLoadingState());
    try {
      _authRepository.forgetPassword(email: email);
      emit(AuthForgotPasswordSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(
        AuthFailureState(
          errorMessage: e.message ?? 'Failed to send reset password',
        ),
      );
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }
}
