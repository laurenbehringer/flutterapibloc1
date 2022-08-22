import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'blackjack_test_event.dart';
part 'blackjack_test_state.dart';

class BlackjackTestBloc extends Bloc<BlackjackTestEvent, BlackjackTestState> {
  BlackjackTestBloc() : super(BlackjackTestInitial()) {
    on<BlackjackTestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
