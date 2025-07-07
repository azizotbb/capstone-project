import 'package:flutter/material.dart';
import 'package:makfoul_app/screen/auth/login/login_screen.dart';
import 'package:makfoul_app/screen/auth/signup/signup.dart';
import 'package:makfoul_app/widget/shared/empty_custom_button.dart';

class GuestSignup extends StatelessWidget {
  const GuestSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,spacing: 16,
          children: [
            Text('Please Sign up or Sign in to view this page'),
            EmptyCustomButton(
              setText: 'Sign up',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
            ),
            EmptyCustomButton(
              setText: 'Sign in',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
