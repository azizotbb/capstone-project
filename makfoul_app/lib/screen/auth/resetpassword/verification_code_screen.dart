import 'package:easy_localization/easy_localization.dart';
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
          'reset_new_password_title'.tr(),
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
              'create_new_password'.tr(),
              style: AppTextStyle.textTitleLarg24light,
            ),
            SizedBox(height: 16),
            Text(
              'reset_password_instructions'.tr(),
              style: AppTextStyle.textDes12,
            ),
            SizedBox(height: 30),
            CustomTextField(
              // validator: (value) {},
              controller: controllerToken,
              suffIcon: Icon(Icons.lock, color: AppColors.colorMedimGrey),
              setHint: 'reset_token_hint'.tr(),
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: controllerEmail,
              validator: (val) {
                return Validators.email(val);
              },
              setHint: 'email'.tr(),
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
              setHint: 'password'.tr(),
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
              setHint: 'confirm_password'.tr(),
              isPassword: true,
              isVisable: isConfirmVisable,
              onPressedSuffix: () {},
            ),
            SizedBox(height: 16),
            PrimryCustomButton(
              setText: 'save'.tr(),
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
