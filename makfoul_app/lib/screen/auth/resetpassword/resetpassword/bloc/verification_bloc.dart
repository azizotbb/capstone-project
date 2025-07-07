import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  // Controller for the email input field
  TextEditingController emailController = TextEditingController();

  // Global key to validate the form in the UI
  final formKey = GlobalKey<FormState>();

  final authGetit = GetIt.I.get<AuthLayer>();

  VerificationBloc() : super(VerificationInitial()) {
    on<ForgotPasswordEvent>(forgotPasswordMethod);
    on<OnFilledEvent>(onFilledMethod);
  }

  /// Handles the ForgotPasswordEvent
  FutureOr<void> forgotPasswordMethod(
    ForgotPasswordEvent event,
    Emitter<VerificationState> emit,
  ) async {
    await authGetit.forgotPasswordMethod(email: emailController.text);
  }

  /// Handles the OnFilledEvent
  ///
  /// Attempts to verify the OTP token entered by the user
  /// Emits [SusseccState] on success and [ErrorState] on failure
  FutureOr<void> onFilledMethod(
    OnFilledEvent event,
    Emitter<VerificationState> emit,
  ) async {
    try {
      await authGetit.verifyWithOTPMethod(
        token: event.token,
        email: emailController.text,
      );
      emit(SusseccState());
    } on AuthException catch (_) {
      emit(ErrorState());
    } catch (error) {
      emit(ErrorState());
    }
  }
}
