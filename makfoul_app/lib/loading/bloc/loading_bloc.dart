import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/repo/api/supabase.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:meta/meta.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial()) {
    on<StartLoadEvent>(startMethod);
  }

  FutureOr<void> startMethod(
    StartLoadEvent event,
    Emitter<LoadingState> emit,
  ) async {
    emit(LoadingProgressState());
    try {
      final tokenUser =
          SupabaseConnect.supabase?.client.auth.currentSession?.accessToken;

      // if (tokenUser != null) {
      //   await GetIt.I.get<AuthLayer>().userinfo;
      // }
    } catch (e) {}
  }
}
