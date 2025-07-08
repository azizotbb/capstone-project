import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/screen/auth/login/login_screen.dart';
import 'package:makfoul_app/screen/auth/signup/signup.dart';
import 'package:makfoul_app/screen/home/homescreen.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/shared/empty_custom_button.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});
  // Welcome screen with Login and Sign Up buttons

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 200),
              Text('welcome'.tr(), style: AppTextStyle.textHeadr36),
              SizedBox(height: 45),
              EmptyCustomButton(
                setText: 'sign_in'.tr(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              SizedBox(height: 16),
              EmptyCustomButton(
                setText: 'create_account'.tr(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
              ),
              SizedBox(height: 200),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(color: AppColors.colorDarkGrey),
                    height: 2,
                    width: context.getWidth(size: 0.37),
                  ),
                  Text('or'.tr(), style: AppTextStyle.textTitleMedium20),
                  Container(
                    decoration: BoxDecoration(color: AppColors.colorDarkGrey),
                    height: 2,
                    width: context.getWidth(size: 0.37),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text(
                  'continue_as_guest'.tr(),
                  style: AppTextStyle.text14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
