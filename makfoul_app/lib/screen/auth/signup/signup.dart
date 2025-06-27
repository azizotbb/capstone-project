import 'package:easy_localization/easy_localization.dart';
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
              Text('create_account'.tr(), style: AppTextStyle.textHeadr36),
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
                setHint: 'number_phone'.tr(),
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
                controller: controllerPassword,
                setHint: 'password'.tr(),
                isPassword: true,
                isVisable: isPasswordVisable,
                onPressedSuffix: () {},
              ),
              SizedBox(height: 16),
              CustomTextField(
                setHint: 'confirm_password'.tr(),
                controller: controllerPasswordConfi,
                validator: (value) {
                  return Validators.confirmPassword(
                    value,
                    controllerPasswordConfi.text,
                  );
                },
                isPassword: true,
                isVisable: isPasswordVisable,
                onPressedSuffix: () {
                  
                },
              ),

              Row(
                children: [
                  Radio(
                    activeColor: AppColors.colorPrimary,
                    value: 'user'.tr(),
                    groupValue: selected,
                    onChanged: (val) {
                      // setState(() {
                      //   selected = val!;
                      // });
                    },
                  ),
                  Text('user'.tr(), style: AppTextStyle.text14),
                  Radio(
                    activeColor: AppColors.colorPrimary,
                    value: 'trainer'.tr(),
                    groupValue: selected,
                    onChanged: (val) {
                      // setState(() {
                      //   selected = val!;
                      // });
                    },
                  ),
                  Text('trainer'.tr(), style: AppTextStyle.text14),
                ],
              ),
              SizedBox(height: 8),
              PrimryCustomButton(setText: 'create_account'.tr(), onPressed: () {}),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Row(
                  children: [
                    Text(
                      'already_have_account'.tr(),
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
                      child: Text('sign_in'.tr(), style: AppTextStyle.text14primary),
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
//       CustomTextField(
//                 validator: (value) {
//                   return Validators.confirmPassword(
//                     value,
//                     controllerPasswordConfi.text,
//                   );
//                 },
//                 controller: controllerPasswordConfi,
//                 setHint: 'Confirm Password',
//                 isPassword: true,
//                 isVisable: isConfirmVisable,
//                 onPressedSuffix: () {},
//               ),