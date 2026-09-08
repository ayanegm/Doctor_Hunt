import 'package:flutter/material.dart';

class AuthControllers {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
  }
}
