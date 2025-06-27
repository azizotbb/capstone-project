part of 'bottom_navigation_bloc.dart';

@immutable
sealed class BottomNavigationState {}

final class BottomNavigationInitial extends BottomNavigationState {}

final class RefreshUIState extends BottomNavigationState {}
