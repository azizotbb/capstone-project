import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final bool isConfirmVisable = false;

  final bool isPasswordVisable = false;

  final TextEditingController controllerNumber = TextEditingController();
  final TextEditingController controllerUserName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerPasswordConfi = TextEditingController();

  String? selected = "user";

  final formKey = GlobalKey<FormState>();

  final authGetit = GetIt.I.get<AuthLayer>();

  SignupBloc() : super(SignupInitial()) {
    on<SelectedRoleEvent>(selectedRolemethod);

    on<CreateNewAccountEvent>(createNewAccountMethod);
  }

  FutureOr<void> selectedRolemethod(
    SelectedRoleEvent event,
    Emitter<SignupState> emit,
  ) {
    selected = event.value;
    emit(RoleUpdateState());
  }

  FutureOr<void> createNewAccountMethod(
    CreateNewAccountEvent event,
    Emitter<SignupState> emit,
  ) async {
    try {
      emit(LoadingState());
      await authGetit.signUpMethod(
        phoneNumber: controllerNumber.text,
        email: controllerEmail.text,
        password: controllerPassword.text,
        role: selected!,
        username: controllerUserName.text,
      );
      controllerEmail.clear();
      controllerNumber.clear();
      controllerPassword.clear();
      controllerPasswordConfi.clear();
      controllerUserName.clear();

      emit(SuccessState());
    } on AuthException catch (error) {
      log(error.message);
    } catch (_) {}
  }
}
