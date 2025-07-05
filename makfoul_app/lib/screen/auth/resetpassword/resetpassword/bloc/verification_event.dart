part of 'verification_bloc.dart';

@immutable
sealed class VerificationEvent {}

class ForgotPasswordEvent extends VerificationEvent {}

class OnFilledEvent extends VerificationEvent {
  final String token;

  OnFilledEvent({required this.token});
}
