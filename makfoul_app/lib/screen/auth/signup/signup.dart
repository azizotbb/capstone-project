import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makfoul_app/screen/auth/login/login_screen.dart';
import 'package:makfoul_app/screen/auth/signup/bloc/signup_bloc.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/utility/validators.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final supabase = Supabase.instance.client;
    // final session = supabase.auth.currentSession;
    // print(session);
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
                      Text('Sign Up', style: AppTextStyle.textHeadr36),
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
                        setHint: 'Number Phone',
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
                        setHint: 'UserName',
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        controller: bloc.controllerEmail,
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
                        controller: bloc.controllerPassword,
                        setHint: 'Password',
                        isPassword: true,
                        isVisable: bloc.isPasswordVisable,
                        onPressedSuffix: () {},
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        validator: (value) {
                          return Validators.confirmPassword(
                            value,
                            bloc.controllerPasswordConfi.text,
                          );
                        },
                        controller: bloc.controllerPasswordConfi,
                        setHint: 'Confirm Password',
                        isPassword: true,
                        isVisable: bloc.isConfirmVisable,
                        onPressedSuffix: () {},
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
                            Future.delayed(
                              const Duration(milliseconds: 500),
                              () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text("Successfully registered"),
                                  ),
                                );
                              },
                            );
                          }
                          return Row(
                            children: [
                              Radio(
                                activeColor: AppColors.colorPrimary,
                                value: 'user',
                                groupValue: bloc.selected,
                                onChanged: (val) {
                                  bloc.add(SelectedRoleEvent(value: val));
                                },
                              ),
                              Text('user', style: AppTextStyle.text14),
                              Radio(
                                activeColor: AppColors.colorPrimary,
                                value: 'trainer',
                                groupValue: bloc.selected,
                                onChanged: (val) {
                                  bloc.add(SelectedRoleEvent(value: val));
                                },
                              ),
                              Text('trainer', style: AppTextStyle.text14),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 8),
                      PrimryCustomButton(
                        setText: 'Sign Up',
                        onPressed: () {
                          if (bloc.formKey.currentState!.validate()) {
                            bloc.add(CreateNewAccountEvent());
                          }
                        },
                      ),
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
                              child: Text(
                                'Sign in',
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
