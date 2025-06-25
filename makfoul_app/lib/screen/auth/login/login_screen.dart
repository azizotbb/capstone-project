import 'package:flutter/material.dart';
import 'package:makfoul_app/screen/auth/resetpassword/reset_password_screen.dart';
import 'package:makfoul_app/screen/auth/signup/signup.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/utility/validators.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  final bool isPasswordVisable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Login',
              style: AppTextStyle.textHeadr36,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 30),
            CustomTextField(
              validator: (value) {
                return Validators.email(value);
              },
              setHint: 'Email',
              suffIcon: Icon(
                Icons.email_outlined,
                color: AppColors.colorMedimGrey,
              ),
            ),
            SizedBox(height: 16),
            CustomTextField(
              setHint: 'Password',
              isPassword: true,
              isVisable: isPasswordVisable,
              onPressedSuffix: () {},
              validator: (value) {
                return Validators.password(value);
              },
            ),
            SizedBox(height: 8),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.colorPrimary,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ResetPasswordScreen()),
                  );
                },

                child: Text(
                  'Forget password ?',
                  style: AppTextStyle.text14,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SizedBox(height: 16),
            PrimryCustomButton(setText: 'Login', onPressed: () {}),
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.only(left: 55),
              child: Row(
                children: [
                  Text("Don't have an account? ", style: AppTextStyle.text14),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text('Sign up', style: AppTextStyle.text14primary),
                  ),
                ],
              ),
            ),

            // Text.rich(
            //   TextSpan(
            //     text: 'Already have an account? Sign in',
            //     style: AppTextStyle.textMedium14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
