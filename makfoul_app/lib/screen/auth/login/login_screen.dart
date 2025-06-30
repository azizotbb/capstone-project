import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makfoul_app/screen/auth/login/bloc/login_bloc.dart';
import 'package:makfoul_app/screen/auth/resetpassword/reset_password_screen.dart';
import 'package:makfoul_app/screen/auth/signup/signup.dart';
import 'package:makfoul_app/screen/splash/splash_screen.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/utility/validators.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<LoginBloc>();

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
                key: bloc.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Text(
                        'Sign in'.tr(),
                        style: AppTextStyle.textHeadr36,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 30),
                      CustomTextField(
                        controller: bloc.controllerEmail,
                        validator: (value) {
                          return Validators.email(value);
                        },
                        setHint: 'Email'.tr(),
                        suffIcon: Icon(
                          Icons.email_outlined,
                          color: AppColors.colorMedimGrey,
                        ),
                      ),
                      SizedBox(height: 16),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return CustomTextField(
                            controller: bloc.controllerPassword,
                            setHint: 'Password'.tr(),
                            isPassword: true,
                            isVisable: bloc.isPasswordVisable,
                            onPressedSuffix: () {
                              bloc.add(VisibilityEvent());
                            },
                            validator: (value) {
                              return Validators.password(value);
                            },
                          );
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
                              MaterialPageRoute(
                                builder: (_) => ResetPasswordScreen(),
                              ),
                            );
                          },

                          child: Text(
                            'Forget password ?'.tr(),
                            style: AppTextStyle.text14,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoadingState) {
                            Future.delayed(
                              const Duration(milliseconds: 200),
                              () {
                                //blue
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.colorPrimary,
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          }
                          if (state is SuccessState) {
                            Navigator.pop(context);
                            Future.delayed(
                              const Duration(milliseconds: 500),
                              () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green[600],
                                    content: Text(
                                      "Logged in successfully".tr(),
                                    ),
                                  ),
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SplashScreen(),
                                  ),
                                );
                              },
                            );
                          }
                          if (state is ErrorState) {
                            Navigator.pop(context);
                            Future.delayed(
                              const Duration(milliseconds: 500),
                              () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red[400],
                                    content: Text(state.msg.tr()),
                                  ),
                                );
                              },
                            );
                          }
                          return PrimryCustomButton(
                            setText: 'Sign in'.tr(),
                            onPressed: () {
                              if (bloc.formKey.currentState!.validate()) {
                                bloc.add(SignInEvent());
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: Row(
                          children: [
                            Text(
                              "Don't have an account? ".tr(),
                              style: AppTextStyle.text14,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign Up'.tr(),
                                style: AppTextStyle.text14primary,
                              ),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
