part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class LodaingState extends OnboardingState {
  final List<String> topImages;
  final List<String> bottomImages;
  final int currentIndex;

  LodaingState({required this.topImages, required this.bottomImages, required this.currentIndex});

 
}
