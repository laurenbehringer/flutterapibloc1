import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'secscreen_event.dart';
part 'secscreen_state.dart';

class SecscreenBloc extends Bloc<SecscreenEvent, SecscreenState> {
  SecscreenBloc() : super(SecscreenInitial()) {

    on<LoadSecscreenEvent>((event, emit) {
        emit(SecScreenLoadedState(event.number + 1));
    });

    on<LoadingSecScreenEvent>((event, emit) {
        emit(SecScreenLoadingState());
    });

  }
}
