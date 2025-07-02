part of 'add_corse_bloc.dart';

@immutable
sealed class AddCorseState {}

final class AddCorseInitial extends AddCorseState {}

final class SelectCategoryState extends AddCorseState {}

final class ErrorState extends AddCorseState {
  final String msg;

  ErrorState(this.msg);
}

final class SuccessState extends AddCorseState {}
final class NullState extends AddCorseState {}

class LocationLodedState extends AddCorseState {
  final LatLng currentLocation;

  LocationLodedState(this.currentLocation);
}

final class PickLocatioState extends AddCorseState {
  final LatLng location;

  PickLocatioState(this.location);
}
