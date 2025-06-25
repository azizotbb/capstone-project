import 'package:flutter/material.dart';
import 'package:makfoul_app/screen/auth/resetpassword/verification_code_screen.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password', style: AppTextStyle.textTitleLarg24),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            // SizedBox(height: 100),
            CustomTextField(setHint: 'Enter Your Email'),
            SizedBox(height: 16),
            PrimryCustomButton(
              setText: 'Reset Password',
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Check your email'),
                      content: Text(
                        'We sent you a code to reset your password',
                      ),
                    );
                  },
                ).then((_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => VerificationCodeScreen()),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
