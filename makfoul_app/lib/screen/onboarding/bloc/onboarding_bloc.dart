import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final List<String> topImages = [
    'assets/images/onboarding1.png',
    'assets/images/onboarding2.png',
    'assets/images/onboarding3.png',
  ];
  final List<String> bottomImages = [
    'assets/images/onboarding4.png',
    'assets/images/onboarding5.png',
    'assets/images/onboarding6.png',
    'assets/images/onboarding7.png',
  ];

  OnboardingBloc() : super(OnboardingInitial()) {
    on<LoadImageEvent>(loadMethod);
    on<ChangeImageEvent>(changeMethod);
  }

  FutureOr<void> loadMethod(
    LoadImageEvent event,
    Emitter<OnboardingState> emit,
  ) {
    emit(
      LodaingState(
        bottomImages: bottomImages,
        topImages: topImages,
        currentIndex: 0,
      ),
    );
  }

  FutureOr<void> changeMethod(
    ChangeImageEvent event,
    Emitter<OnboardingState> emit,
  ) {
    if (state is LodaingState) {
      final currentState = state as LodaingState;
      emit(
        LodaingState(
          bottomImages: currentState.bottomImages,
          topImages: currentState.topImages,
          currentIndex: event.index,
        ),
      );
    }
  }
}
// if(state is LodaingState){
    //   final currentIndex = 
    // }
    // final List<String> images = ['1', '2', '3', '4'];
    // emit(LodaingState(images: images, currentIndex: 0));
    // if (state is LodaingState) {
    //   final currentState = state;
    //   emit(LodaingState(images: currentState., currentIndex: event.index));
    // }