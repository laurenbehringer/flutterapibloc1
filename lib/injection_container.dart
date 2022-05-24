import 'package:flutterapibloc1/bloc/buttontxt/buttontxt_bloc.dart';
import 'package:flutterapibloc1/bloc/home_bloc/home_bloc.dart';
import 'package:flutterapibloc1/bloc/secscree/secscreen_bloc.dart';
import 'package:flutterapibloc1/data/services/activity_service.dart';
import 'package:flutterapibloc1/data/services/connectivity_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async{
  sl.registerFactory(() => ButtontxtBloc());
  sl.registerFactory(() => SecscreenBloc());
  sl.registerFactory(() => HomeBloc(sl(), sl()));
  sl.registerLazySingleton(() => ActivityService());
  sl.registerLazySingleton(() => ConnectivityService());
}