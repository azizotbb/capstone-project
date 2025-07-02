part of 'add_corse_bloc.dart';

@immutable
sealed class AddCorseEvent {}

class SelectCategoryEvent extends AddCorseEvent {
  final String value;

  SelectCategoryEvent({required this.value});
}

class AddNewCordeEvent extends AddCorseEvent {}

class UploadImageEvent extends AddCorseEvent {}

class DynamicLocationEvent extends AddCorseEvent {}

class PickLocatioEvent extends AddCorseEvent {
  final LatLng location;

  PickLocatioEvent({required this.location});
}

class SavePickedLocationEvent extends AddCorseEvent {
  final LatLng finalLocation;

  SavePickedLocationEvent(this.finalLocation);
}
