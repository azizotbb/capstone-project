import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/screen/home/homescreen.dart';
import 'package:makfoul_app/screen/orders-related/order_screen.dart';
import 'package:makfoul_app/screen/profile/profile_screen.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final userinfo = GetIt.I.get<AuthLayer>().userinfo;

  int selectIndex = 0;

  // List of screens shown when changing bottom navigation
  String role = 'x';
  List<Widget> listWidget = [HomeScreen(), OrderScreen(), ProfileScreen()];

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
