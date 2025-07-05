import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:meta/meta.dart';

part 'verificationn_event.dart';
part 'verificationn_state.dart';

class VerificationnBloc extends Bloc<VerificationnEvent, VerificationnState> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController controllerNewPassword = TextEditingController();
  final TextEditingController controllerNewPasswordConfi =
      TextEditingController();

  bool isVisable = true;
  bool isVisableConfirmPassword = true;

  final getAuth = GetIt.I.get<AuthLayer>();

  VerificationnBloc() : super(VerificationnInitial()) {
    on<VisibilityEvent>(showPasswordMethod);
    on<VisibilityConfirmEvent>(showConfirmPasswordMethod);
    on<UpdatePasswordEvent>(updatePasswordMethod);
  }

  FutureOr<void> showPasswordMethod(
    VisibilityEvent event,
    Emitter<VerificationnState> emit,
  ) {
    isVisable = !isVisable;

    emit(SuccessState());
  }

  FutureOr<void> showConfirmPasswordMethod(
    VisibilityConfirmEvent event,
    Emitter<VerificationnState> emit,
  ) {
    isVisableConfirmPassword = !isVisableConfirmPassword;

    emit(SuccessState());
  }

  FutureOr<void> updatePasswordMethod(
    UpdatePasswordEvent event,
    Emitter<VerificationnState> emit,
  ) {
    getAuth.updatePasswordMethod(
      password: controllerNewPassword.text,
      oldPassword: controllerNewPasswordConfi.text,
    );
  }
}
