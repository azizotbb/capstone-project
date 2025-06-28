import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/screen/onboarding/onboarding.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/widget/botton_nav/bottom_navigation_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

    // Get the current authentication session
    final session = supabase.auth.currentSession;

    // Access the user info model from the AuthLayer
    final userinfo = GetIt.I.get<AuthLayer>().userinfo;

    // Delay navigation for 3 seconds to show the splash screen
    Future.delayed(Duration(seconds: 3), () {
      if (session?.isExpired == false) {
        // If session is active, populate the user info model with data from Supabase
        userinfo.uid = session!.user.id;
        userinfo.username = session.user.userMetadata?["username"];
        userinfo.email = session.user.email!;
        userinfo.role = session.user.userMetadata?["role"];
        userinfo.phone = session.user.userMetadata?["phoneNumber"];
        userinfo.createdAt = session.user.createdAt;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigationWidget()),
        );
      } else {
        // If no session or expired, navigate to onboarding screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnBoarding()),
        );
      }
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
