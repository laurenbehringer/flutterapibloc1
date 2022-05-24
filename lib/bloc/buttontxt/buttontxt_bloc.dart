import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'buttontxt_event.dart';
part 'buttontxt_state.dart';

class ButtontxtBloc extends Bloc<ButtontxtEvent, ButtontxtState> {
  ButtontxtBloc() : super(ButtontxtInitialState()) {
    on<ButtontxtEvent>((event, emit) {
      if (event is Increment){
        emit(IncrementSuccessState(number: event.number + 1));
      }

      if (event is LoadButtontxtEvent){
        emit(ButtonTxtLoadingState(number: event.number));
      }
    });

  }
}
