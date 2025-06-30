part of 'add_corse_bloc.dart';

@immutable
sealed class AddCorseState {}

final class AddCorseInitial extends AddCorseState {}

final class SelectCategoryState extends AddCorseState {}
final class SuccessState extends AddCorseState {}
