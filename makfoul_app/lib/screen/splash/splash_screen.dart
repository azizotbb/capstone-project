import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/screen/onboarding/onboarding.dart';
import 'package:makfoul_app/style/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorScondry,
      body: InkWell(
        //  inkwell مؤقت الى ما اشتغل ع البلوك 
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnBoarding()),
          );
        },
        child: Center(
          child: SizedBox(
            height: context.getHeight(size: 0.08),
            width: context.getWidth(size: 0.8),
            child: Image.asset('asset/images/logo_makfol-removebg-preview.png'),
          ),
        ),
      ),
    );
  }
}
