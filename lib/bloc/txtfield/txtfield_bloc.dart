import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'txtfield_event.dart';
part 'txtfield_state.dart';

class TxtfieldBloc extends Bloc<TxtfieldEvent, TxtfieldState> {
  TxtfieldBloc() : super(TxtfieldInitial(initPassword: "", initUsername: "", widget: "")) {
    on<TxtfieldEvent>((event, emit) {
      if (event is LoadTxtfieldEvent){
        emit(TxtfieldInitial(initPassword: event.password, initUsername: event.username, widget: event.widget));
      }
      if (event is LoadingTxtfieldEvent){
        emit(TxtfieldLoading());
      }
    });

  }
}
