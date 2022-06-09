import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapibloc1/data/services/activity_service.dart';
import 'package:flutterapibloc1/data/services/connectivity_service.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ActivityService activityService;


  HomeBloc({required this.activityService}) : super(HomeLoadingState()){

    on<LoadActivityApiEvent>((event, emit) async {
      emit(HomeLoadingState());
      final activity = await activityService.getActivityApi();
      emit(HomeLoadedState(activity.activity, activity.type, activity.participants));
    });

    on<NoConnectionEvent>((event,emit) {
      emit(HomeNoConnectionState());
    });

  }
}
