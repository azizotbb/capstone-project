part of 'verificationn_bloc.dart';

@immutable
sealed class VerificationnState {}

final class VerificationnInitial extends VerificationnState {}

final class SuccessState extends VerificationnState {}
