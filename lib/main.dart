import 'package:doctor_hunt/features/login/login_page.dart';
import 'package:doctor_hunt/features/onboarding/onboarding_page_01.dart';
import 'package:doctor_hunt/features/onboarding/onboarding_page_02.dart';
import 'package:doctor_hunt/features/onboarding/onboarding_page_03.dart';
import 'package:doctor_hunt/features/login/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          OnboardingPage01(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
