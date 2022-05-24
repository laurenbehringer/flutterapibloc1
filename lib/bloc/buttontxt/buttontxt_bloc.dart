import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'buttontxt_event.dart';
part 'buttontxt_state.dart';

class ButtontxtBloc extends Bloc<ButtontxtEvent, ButtontxtState> {
  ButtontxtBloc() : super(ButtontxtInitialState()) {
    on<ButtontxtEvent>((event, emit) {
      // TODO: implement event handler

      if (event is Increment){
        emit(
          IncrementSuccessState(
            number: event.number + 1,
          )
        );
      }


    });
  }
}
