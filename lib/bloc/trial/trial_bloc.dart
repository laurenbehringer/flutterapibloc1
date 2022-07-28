import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trial_event.dart';
part 'trial_state.dart';

class TrialBloc extends Bloc<TrialEvent, TrialState> {
  TrialBloc() : super(TrialInitial()) {
    on<TrialEvent>((event, emit) {

      if (event is ChangeSliderEvent){
        emit(ChangeSliderValState(event.value));
      }

    });
  }
}
