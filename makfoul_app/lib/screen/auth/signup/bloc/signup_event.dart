part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SelectedRoleEvent extends SignupEvent {
  final String? value;

  SelectedRoleEvent({required this.value});
}

class CreateNewAccountEvent extends SignupEvent {}
