import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makfoul_app/screen/auth/login/login_screen.dart';
import 'package:makfoul_app/screen/auth/resetpassword/verification/bloc/verificationn_bloc.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/utility/validators.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationnBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<VerificationnBloc>();
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(24),
              child: Form(
                key: bloc.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60),

                      Text(
                        'Set Your New Password'.tr(),
                        style: AppTextStyle.textTitleLarg24dark,
                      ),
                      SizedBox(height: 30),

                      BlocBuilder<VerificationnBloc, VerificationnState>(
                        builder: (context, state) {
                          return CustomTextField(
                            validator: (value) {
                              return Validators.password(value);
                            },
                            controller: bloc.controllerNewPassword,
                            setHint: 'password'.tr(),
                            isPassword: true,
                            isVisable: bloc.isVisable,
                            onPressedSuffix: () {
                              bloc.add((VisibilityEvent()));
                            },
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      BlocBuilder<VerificationnBloc, VerificationnState>(
                        builder: (context, state) {
                          return CustomTextField(
                            validator: (value) {
                              return Validators.confirmPassword(
                                value,
                                bloc.controllerNewPassword.text,
                              );
                            },
                            controller: bloc.controllerNewPasswordConfi,
                            setHint: 'confirm_password'.tr(),
                            isPassword: true,
                            isVisable: bloc.isVisableConfirmPassword,
                            onPressedSuffix: () {
                              bloc.add(VisibilityConfirmEvent());
                            },
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      PrimryCustomButton(
                        setText: 'save'.tr(),
                        onPressed: () {
                          bloc.add(UpdatePasswordEvent());
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
