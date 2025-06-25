import 'package:flutter/material.dart';
import 'package:makfoul_app/screen/auth/login/login_screen.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/utility/validators.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final bool isConfirmVisable = false;

  final bool isPasswordVisable = false;
  final TextEditingController controllerNumber = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerPasswordConfi = TextEditingController();

  final String selected = 'user';
  final formKey = GlobalKey<FormState>();
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
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text('Sign Up', style: AppTextStyle.textHeadr36),
              SizedBox(height: 45),
              CustomTextField(
                validator: (value) {
                  // This function uses the Validators class to validate the input
                  return Validators.numberPhone(value);
                },
                controller: controllerNumber,
                suffIcon: Icon(
                  Icons.phone_android,
                  color: AppColors.colorMedimGrey,
                ),
                setHint: 'Number Phone',
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
                controller: controllerPassword,
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
                    controllerPasswordConfi.text,
                  );
                },
                controller: controllerPasswordConfi,
                setHint: 'Confirm Password',
                isPassword: true,
                isVisable: isConfirmVisable,
                onPressedSuffix: () {},
              ),
              Row(
                children: [
                  Radio(
                    activeColor: AppColors.colorPrimary,
                    value: 'user',
                    groupValue: selected,
                    onChanged: (val) {
                      // setState(() {
                      //   selected = val!;
                      // });
                    },
                  ),
                  Text('user', style: AppTextStyle.text14),
                  Radio(
                    activeColor: AppColors.colorPrimary,
                    value: 'trainer',
                    groupValue: selected,
                    onChanged: (val) {
                      // setState(() {
                      //   selected = val!;
                      // });
                    },
                  ),
                  Text('trainer', style: AppTextStyle.text14),
                ],
              ),
              SizedBox(height: 8),
              PrimryCustomButton(setText: 'Sign Up', onPressed: () {}),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Row(
                  children: [
                    Text(
                      'Already have an account? ',
                      style: AppTextStyle.text14,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text('Sign in', style: AppTextStyle.text14primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
