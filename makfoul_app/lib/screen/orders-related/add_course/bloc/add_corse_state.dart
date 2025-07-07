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

  PickLocatioState(this.location);}

final class CoursesLoaded extends AddCorseState {
  final List<CourseModel>? trainearcourses;
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
  CoursesLoaded copyWith({
    final List<CourseModel>? trainearcourses,
    final int? total,
    final int? active,
    final int? inactive,
    final int? cook,
    final int? clean,
  }) {
    return CoursesLoaded(
      trainearcourses: trainearcourses ?? this.trainearcourses,
      total: total ?? this.total,
      active: active ?? this.active,
      inactive: inactive ?? this.inactive,
      cook: cook ?? this.cook,
      clean: clean ?? this.clean,
    );
  }
}
final class updateserch extends AddCorseState{
  final List<dynamic>toserch;

  updateserch({required this.toserch});

}
