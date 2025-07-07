part of 'verificationn_bloc.dart';

@immutable
sealed class VerificationnEvent {}

final class VisibilityEvent extends VerificationnEvent {}

final class VisibilityConfirmEvent extends VerificationnEvent {}

final class UpdatePasswordEvent extends VerificationnEvent {}
