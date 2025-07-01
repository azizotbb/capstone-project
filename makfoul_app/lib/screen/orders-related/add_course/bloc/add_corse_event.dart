part of 'add_corse_bloc.dart';

@immutable
sealed class AddCorseEvent {}

class SelectCategoryEvent extends AddCorseEvent {
  final String value;

  SelectCategoryEvent({required this.value});
}

class AddNewCordeEvent extends AddCorseEvent {}
class UploadImageEvent extends AddCorseEvent {}
class GetCoursesEvent extends AddCorseEvent{
  final String? id;

  GetCoursesEvent({ this.id}); 
}

class DeleteCourseEvent extends AddCorseEvent{
  final int courseId;

  DeleteCourseEvent({required this.courseId}); 
}
