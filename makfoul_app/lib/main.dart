import 'package:flutter/material.dart';
import 'package:makfoul_app/screen/auth/login/login_screen.dart';
import 'package:makfoul_app/screen/auth/resetpassword/reset_password_screen.dart';
import 'package:makfoul_app/screen/auth/resetpassword/verification_code_screen.dart';
import 'package:makfoul_app/screen/auth/signup/signup.dart';
import 'package:makfoul_app/screen/auth/welcom_screen.dart';
import 'package:makfoul_app/screen/course/details_course.dart';
import 'package:makfoul_app/screen/home/homescreen.dart';
import 'package:makfoul_app/screen/orders-related/add_course_screen.dart';
import 'package:makfoul_app/screen/orders-related/order_screen.dart';
import 'package:makfoul_app/screen/profile/profile_screen.dart';
import 'package:makfoul_app/screen/home/homescreen_trainer_screen.dart';
import 'package:makfoul_app/screen/trainer/trainer_screen.dart';
import 'package:makfoul_app/style/app_theme.dart';
import 'package:makfoul_app/widget/botton_nav/bottom_navigation_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      home: BottomNavigationWidget(),
    );
  }
}
