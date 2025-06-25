import 'package:flutter/material.dart';
import 'package:makfoul_app/screen/auth/login/login_screen.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/utility/validators.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({super.key});
  final TextEditingController controllerToken = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerNewPassword = TextEditingController();
  final TextEditingController controllerNewPasswordConfi =
      TextEditingController();

  final bool isConfirmVisable = false;

  final bool isPasswordVisable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset New Password',
          style: AppTextStyle.textTitleLarg24light,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Create New Password',
              style: AppTextStyle.textTitleLarg24light,
            ),
            SizedBox(height: 16),
            Text(
              'Enter the reset token from your email and set a new password',
              style: AppTextStyle.textDes12,
            ),
            SizedBox(height: 30),
            CustomTextField(
              validator: (value) {},
              controller: controllerToken,
              suffIcon: Icon(Icons.lock, color: AppColors.colorMedimGrey),
              setHint: 'Reset Token',
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: controllerEmail,
              validator: (val) {
                return Validators.email(val);
              },
              setHint: 'Email',
              suffIcon: Icon(
                Icons.email_outlined,
                color: AppColors.colorMedimGrey,
              ),
            ),
            SizedBox(height: 16),
            CustomTextField(
              validator: (value) {
                return Validators.password(value);
              },
              controller: controllerNewPassword,
              setHint: 'Password',
              isPassword: true,
              isVisable: isPasswordVisable,
              onPressedSuffix: () {},
            ),
            SizedBox(height: 16),
            CustomTextField(
              validator: (value) {
                return Validators.confirmPassword(
                  value,
                  controllerNewPasswordConfi.text,
                );
              },
              controller: controllerNewPasswordConfi,
              setHint: 'Confirm Password',
              isPassword: true,
              isVisable: isConfirmVisable,
              onPressedSuffix: () {},
            ),
            SizedBox(height: 16),
            PrimryCustomButton(
              setText: 'Save',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
