part of 'verification_bloc.dart';

@immutable
sealed class VerificationState {}

final class VerificationInitial extends VerificationState {}

final class ErrorState extends VerificationState {}

final class SusseccState extends VerificationState {}
