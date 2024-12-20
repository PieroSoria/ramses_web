import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initialState()) {
    on<_OnChangeHover>(_onChangeHover);
  }

  void _onChangeHover(_OnChangeHover event, Emitter<AppState> emit) async {
    emit(state.copyWith(ishover: event.ishover));
  }
}
