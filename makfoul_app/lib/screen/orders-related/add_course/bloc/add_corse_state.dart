part of 'add_corse_bloc.dart';

@immutable
sealed class AddCorseState {}

final class AddCorseInitial extends AddCorseState {}

final class SelectCategoryState extends AddCorseState {}

final class SuccessState extends AddCorseState {}

final class CoursesLoaded extends AddCorseState {
  final List<CourseModel>?trainearcourses; 
  final int? total;
  final int? active;
  final int? inactive;
  final int? cook;
  final int? clean;

  CoursesLoaded({
     this.total,
     this.active,
     this.inactive,
     this.cook,
     this.clean,
    this.trainearcourses,
  });
}

