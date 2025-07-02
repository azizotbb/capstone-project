import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makfoul_app/screen/auth/login/login_screen.dart';
import 'package:makfoul_app/screen/auth/signup/bloc/signup_bloc.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/utility/validators.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<SignupBloc>();

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
                      Text('Sign Up'.tr(), style: AppTextStyle.textHeadr36),
                      SizedBox(height: 45),
                      CustomTextField(
                        validator: (value) {
                          // This function uses the Validators class to validate the input
                          return Validators.numberPhone(value);
                        },
                        controller: bloc.controllerNumber,
                        suffIcon: Icon(
                          Icons.phone_android,
                          color: AppColors.colorMedimGrey,
                        ),
                        setHint: 'Phone Number'.tr(),
                      ),
                      SizedBox(height: 16),
                      //-
                      CustomTextField(
                        validator: (value) {
                          // This function uses the Validators class to validate the input
                          return Validators.username(value);
                        },
                        controller: bloc.controllerUserName,
                        suffIcon: Icon(
                          Icons.person,
                          color: AppColors.colorMedimGrey,
                        ),
                        setHint: 'Name'.tr(),
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        controller: bloc.controllerEmail,
                        validator: (val) {
                          return Validators.email(val);
                        },
                        setHint: 'Email'.tr(),
                        suffIcon: Icon(
                          Icons.email_outlined,
                          color: AppColors.colorMedimGrey,
                        ),
                      ),
                      SizedBox(height: 16),
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          return CustomTextField(
                            validator: (value) {
                              return Validators.password(value);
                            },
                            controller: bloc.controllerPassword,
                            setHint: 'Password'.tr(),
                            isPassword: true,
                            isVisable: bloc.isPasswordVisable,
                            onPressedSuffix: () {
                              print(bloc.isPasswordVisable);

                              bloc.add(VisibilityEvent());
                            },
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          return CustomTextField(
                            validator: (value) {
                              return Validators.confirmPassword(
                                value,
                                bloc.controllerPasswordConfi.text,
                              );
                            },
                            controller: bloc.controllerPasswordConfi,
                            setHint: 'Confirm Password'.tr(),
                            isPassword: true,
                            isVisable: bloc.isConfirmVisable,
                            onPressedSuffix: () {
                              print(bloc.isConfirmVisable);
                              bloc.add(VisibilityConfirmEvent());
                            },
                          );
                        },
                      ),
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          if (state is LoadingState) {
                            Future.delayed(
                              const Duration(milliseconds: 200),
                              () {
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
                            Future.delayed(const Duration(milliseconds: 500), () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green[600],
                                  content: Text(
                                    "We’ve sent a verification link to your email. Please check your inbox"
                                        .tr(),
                                  ),
                                ),
                              );
                            });
                          }
                          return Row(
                            children: [
                              Radio(
                                activeColor: AppColors.colorPrimary,
                                value: 'User',
                                groupValue: bloc.selected,
                                onChanged: (val) {
                                  bloc.add(SelectedRoleEvent(value: val));
                                },
                              ),
                              Text('user'.tr(), style: AppTextStyle.text14),
                              Radio(
                                activeColor: AppColors.colorPrimary,
                                value: 'Trainer',
                                groupValue: bloc.selected,
                                onChanged: (val) {
                                  bloc.add(SelectedRoleEvent(value: val));
                                },
                              ),
                              Text('trainer'.tr(), style: AppTextStyle.text14),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 8),
                      PrimryCustomButton(
                        setText: 'Sign Up'.tr(),
                        onPressed: () {
                          if (bloc.formKey.currentState!.validate()) {
                            bloc.add(CreateNewAccountEvent());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: Row(
                          children: [
                            Text(
                              'Already have an account? '.tr(),
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
                              child: Text(
                                'Sign in'.tr(),
                                style: AppTextStyle.text14primary,
                              ),
                            ),
                          ],
                        ),
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