import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makfoul_app/screen/auth/resetpassword/verification/verification_code_screen.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('reset_password'.tr(), style: AppTextStyle.textTitleLarg24light),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            // SizedBox(height: 100),
            CustomTextField(setHint: 'enter_email'.tr()),
            SizedBox(height: 16),
            PrimryCustomButton(
              setText: 'reset_password'.tr(),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('check_your_email'.tr()),
                      content: Text(
                        'reset_code_sent_message'.tr(),
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
