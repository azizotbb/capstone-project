part of 'add_corse_bloc.dart';

@immutable
sealed class AddCorseEvent {}

class SelectCategoryEvent extends AddCorseEvent {
  final String value;

  SelectCategoryEvent({required this.value});
}

class AddNewCordeEvent extends AddCorseEvent {}
