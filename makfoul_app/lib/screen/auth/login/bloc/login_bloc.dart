import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
   bool isPasswordVisable = true;

  // Key for form validation
  final formKey = GlobalKey<FormState>();

  // Controllers for email and password input fields
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  // Access the AuthLayer using GetIt dependency injection
  final authGetit = GetIt.I.get<AuthLayer>();

  LoginBloc() : super(LoginInitial()) {
    on<SignInEvent>(SignInMethod);
    on<VisibilityEvent>(showPasswordMethod);
  }

  // Handles the sign-in process when SignInEvent is triggered
  FutureOr<void> SignInMethod(
    SignInEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoadingState());

    try {
      await authGetit.signInMethod(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
      controllerEmail.clear();
      controllerPassword.clear();
      emit(SuccessState());
    } on AuthException catch (error) {
      if (error.message == "Invalid login credentials") {
        emit(
          ErrorState(
            msg:
                "The email or password you entered is incorrect. Please try again",
          ),
        );
      } else if (error.message == "Email not confirmed") {
        emit(ErrorState(msg: "Email not confirmed"));
      } else {
        emit(ErrorState(msg: "Something went wrong. Please try again."));
      }
      log(error.message);
    } catch (error) {
      print(error);
    }
  }

  FutureOr<void> showPasswordMethod(VisibilityEvent event, Emitter<LoginState> emit) {
    isPasswordVisable = !isPasswordVisable;

    emit(SuccessStateShowPassword());
  }
}
