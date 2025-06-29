part of 'verification_bloc.dart';

@immutable
sealed class VerificationEvent {}


final class VisibilityEvent extends VerificationEvent{}
final class VisibilityConfirmEvent extends VerificationEvent{}