part of 'bottom_navigation_bloc.dart';

@immutable
sealed class BottomNavigationEvent {}

class ChangeNavSelectEvent extends BottomNavigationEvent {
  final int index;

  ChangeNavSelectEvent({required this.index});
}