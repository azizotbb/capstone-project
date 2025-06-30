import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  bool isVisable = true;
  bool isVisableConfirmPassword = true;

  VerificationBloc() : super(VerificationInitial()) {
    on<VisibilityEvent>(showPasswordMethod);
    on<VisibilityConfirmEvent>(showConfirmPasswordMethod);
  }

  FutureOr<void> showPasswordMethod(VisibilityEvent event, Emitter<VerificationState> emit) {

      isVisable = !isVisable;

      emit(SuccessState());

  }

  FutureOr<void> showConfirmPasswordMethod(VisibilityConfirmEvent event, Emitter<VerificationState> emit) {
    
      isVisableConfirmPassword = !isVisableConfirmPassword;

      emit(SuccessState());
  }
}
