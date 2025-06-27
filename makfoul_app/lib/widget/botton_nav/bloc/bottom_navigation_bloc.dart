import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:makfoul_app/screen/home/homescreen.dart';
import 'package:makfoul_app/screen/home/homescreen_trainer_screen.dart';
import 'package:makfoul_app/screen/orders-related/add_course_screen.dart';
import 'package:makfoul_app/screen/orders-related/order_screen.dart';
import 'package:makfoul_app/screen/profile/profile_screen.dart';
import 'package:makfoul_app/screen/trainer/trainer_screen.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  int selectIndex = 0;

  // List of screens shown when changing bottom navigation
  String role = 'x';
  List<Widget> listWidget = [
    HomeScreen(name: "Raghad"),
    OrderScreen(),
    ProfileScreen(),
  ];

  BottomNavigationBloc() : super(BottomNavigationInitial()) {
    on<ChangeNavSelectEvent>(ChangeNavSelectMethod);
  }

  FutureOr<void> ChangeNavSelectMethod(
    ChangeNavSelectEvent event,
    Emitter<BottomNavigationState> emit,
  ) {

    selectIndex = event.index;
    emit(RefreshUIState());
  }
}
