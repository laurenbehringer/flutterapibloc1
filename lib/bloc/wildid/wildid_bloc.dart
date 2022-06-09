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

  final WildidService wildidService;

  WildidBloc({required this.wildidService}) : super(WildidInitial()) {

    on<LoadWildidApiEvent>((event, emit) async {
      emit(WildidLoadingState());
      try {
        final wildid = await wildidService.getWildidAPI();
        emit(WildidLoadedState(wildid.status, wildid.articles));
      } catch (e){
        emit(WildidLoadFailedState());
      }
    });

    on<NoConnectionEvent>((event,emit) {
      emit(WildidNoConnectionState());
    });

  }
}
