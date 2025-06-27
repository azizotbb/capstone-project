import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makfoul_app/screen/auth/login/bloc/login_bloc.dart';
import 'package:makfoul_app/screen/auth/resetpassword/reset_password_screen.dart';
import 'package:makfoul_app/screen/auth/signup/signup.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/utility/validators.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    final session = supabase.auth.currentSession;
    print(session?.user);
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
                        'Login',
                        style: AppTextStyle.textHeadr36,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 30),
                      CustomTextField(
                        controller: bloc.controllerEmail,
                        validator: (value) {
                          return Validators.email(value);
                        },
                        setHint: 'Email',
                        suffIcon: Icon(
                          Icons.email_outlined,
                          color: AppColors.colorMedimGrey,
                        ),
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        controller: bloc.controllerPassword,
                        setHint: 'Password',
                        isPassword: true,
                        isVisable: bloc.isPasswordVisable,
                        onPressedSuffix: () {},
                        validator: (value) {
                          return Validators.password(value);
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
                            'Forget password ?',
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
                                    content: Text("Logged in successfully"),
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
                                    content: Text(state.msg),
                                  ),
                                );
                              },
                            );
                          }
                          return PrimryCustomButton(
                            setText: 'Login',
                            onPressed: () {
                              if (bloc.formKey.currentState!.validate()) {
                                bloc.add(SignInEvent());
                                print("-----------------------------");
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
                              "Don't have an account? ",
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
                                'Sign up',
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
