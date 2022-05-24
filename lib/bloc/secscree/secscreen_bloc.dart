import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'secscreen_event.dart';
part 'secscreen_state.dart';

class SecscreenBloc extends Bloc<SecscreenEvent, SecscreenState> {
  SecscreenBloc() : super(SecscreenInitial()) {

    on<LoadSecscreenEvent>((event, emit) {
      if (event is LoadSecscreenEvent){
        emit(SecScreenLoadingState());
        print (event);
        emit(SecScreenLoadedState(event.number + 1));
      }
    });
  }
}
