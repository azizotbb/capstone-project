import 'package:flutter/material.dart';
import 'package:makfoul_app/screen/home/homescreen.dart';
import 'package:makfoul_app/screen/onboarding/onboarding.dart';
import 'package:makfoul_app/screen/splash/splash_screen.dart';
import 'package:makfoul_app/style/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashScreen(),
    );
  }
}
