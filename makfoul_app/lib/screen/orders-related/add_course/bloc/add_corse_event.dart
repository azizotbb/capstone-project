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

  SavePickedLocationEvent(this.finalLocation);}
class GetCoursesEvent extends AddCorseEvent{
  final String? id;

  GetCoursesEvent({ this.id}); 
}

class DeleteCourseEvent extends AddCorseEvent{
  final int courseId;

  DeleteCourseEvent({required this.courseId}); 
}

class UpdateSearchQuery extends AddCorseEvent {
  final String searchtext;
  final List<dynamic>toserch;
  UpdateSearchQuery({required this.searchtext,required this.toserch});

}