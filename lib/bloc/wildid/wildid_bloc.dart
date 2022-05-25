import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapibloc1/data/models/wildid_api.dart';
import 'package:flutterapibloc1/data/services/activity_service.dart';
import 'package:flutterapibloc1/data/services/connectivity_service.dart';
import 'package:flutterapibloc1/data/services/wildid_service.dart';

part 'wildid_event.dart';
part 'wildid_state.dart';

class WildidBloc extends Bloc<WildidEvent, WildidState> {

  final WildidService _wildidService;

  WildidBloc(this._wildidService) : super(WildidInitial()) {
    print('broh1');


    on<LoadWildidApiEvent>((event, emit) async {
      print('broh2');
      emit(WildidLoadingState());
      final wildid = await _wildidService.getWildidAPI();
      emit(WildidLoadedState(wildid.status, wildid.articles));
    });

    on<NoConnectionEvent>((event,emit) {
      emit(WildidNoConnectionState());
    });


  }
}
