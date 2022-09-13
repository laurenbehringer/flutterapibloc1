import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'set_balance_event.dart';
part 'set_balance_state.dart';

class SetBalanceBloc extends Bloc<SetBalanceEvent, SetBalanceState> {
  SetBalanceBloc() : super(SetBalanceInitial()) {
    on<SetBalanceEvent>((event, emit) async {
      if (event is ResetBankrollEvent) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt("temp", event.tempVal);
      }
    });
  }
}
