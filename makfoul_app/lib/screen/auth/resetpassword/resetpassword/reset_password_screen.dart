import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code_field/flutter_verification_code_field.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/screen/auth/resetpassword/resetpassword/bloc/verification_bloc.dart';
import 'package:makfoul_app/screen/auth/resetpassword/verification/verification_code_screen.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/utility/validators.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<VerificationBloc>();

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'reset_password'.tr(),
                style: AppTextStyle.textTitleLarg24light,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(24),
              child: Form(
                key: bloc.formKey,
                child: Column(
                  children: [
                    // SizedBox(height: 100),
                    CustomTextField(
                      setHint: 'enter_email'.tr(),
                      controller: bloc.emailController,
                      validator: (val) {
                        return Validators.email(val);
                      },
                    ),
                    SizedBox(height: 16),
                    PrimryCustomButton(
                      setText: 'reset_password'.tr(),
                      onPressed: () async {
                        if (bloc.formKey.currentState!.validate()) {
                          bloc.add(ForgotPasswordEvent());

                          showModalBottomSheet(
                            showDragHandle: true,
                            useSafeArea: true,
                            isScrollControlled: true,

                            context: context,
                            builder: (context) => BlocProvider.value(
                              value: bloc,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(
                                    context,
                                  ).viewInsets.bottom,
                                ),
                                child: SizedBox(
                                  width: context.getWidth(),
                                  height: 300,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Verification".tr(),
                                        style: AppTextStyle.textTitleLarg24dark,
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        "Enter the code send to the email:"
                                            .tr(),
                                        style: AppTextStyle.textReguler16,
                                      ),
                                      SizedBox(height: 8),

                                      Text(
                                        bloc.emailController.text,
                                        style: AppTextStyle.textReguler16,
                                      ),
                                      SizedBox(height: 16),
                                      VerificationCodeField(
                                        length: 6,

                                        onFilled: (value) {
                                          bloc.add(OnFilledEvent(token: value));
                                          return;
                                        },
                                        size: Size(30, 60),
                                        spaceBetween: 16,
                                        matchingPattern: RegExp(r'^\d+$'),
                                      ),
                                      SizedBox(height: 16),
                                      BlocBuilder<
                                        VerificationBloc,
                                        VerificationState
                                      >(
                                        builder: (context, state) {
                                          if (state is SusseccState) {
                                            Future.delayed(
                                              const Duration(
                                                milliseconds: 1000,
                                              ),
                                              () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        VerificationCodeScreen(),
                                                  ),
                                                );
                                              },
                                            );
                                            return Container();
                                          }
                                          if (state is ErrorState) {
                                            return Text(
                                              "Invalid verification code".tr(),
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            );
                                          }
                                          return Container();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
