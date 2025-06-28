part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class LoadImageEvent extends OnboardingEvent {
  
  

 
 
}

class ChangeImageEvent extends OnboardingEvent{
final int index;

  ChangeImageEvent({required this.index});

}