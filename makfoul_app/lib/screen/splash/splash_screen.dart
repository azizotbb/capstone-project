import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/screen/onboarding/onboarding.dart';
import 'package:makfoul_app/style/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      print('i was here');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoarding()),
      );
    });
    return Scaffold(
      backgroundColor: AppColors.colorScondry,
      body: Center(
        child: Image.asset(
          'assets/images/logomakfoul.png',
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}
