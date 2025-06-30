part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}


class UpdatePasswordEvent extends ProfileEvent{}
class UpdateNameEvent extends ProfileEvent{}
class UpdateImageEvent extends ProfileEvent{}