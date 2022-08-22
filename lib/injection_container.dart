import 'package:flutterapibloc1/bloc/bj_bloc/blackjackk_bloc.dart';
import 'package:flutterapibloc1/bloc/buttontxt/buttontxt_bloc.dart';
import 'package:flutterapibloc1/bloc/deviceInfo/deviceinfo_bloc.dart';
import 'package:flutterapibloc1/bloc/home_bloc/home_bloc.dart';
import 'package:flutterapibloc1/bloc/login/loginn_bloc.dart';
import 'package:flutterapibloc1/bloc/secscree/secscreen_bloc.dart';
import 'package:flutterapibloc1/bloc/trial/trial_bloc.dart';
import 'package:flutterapibloc1/bloc/txtfield/txtfield_bloc.dart';
import 'package:flutterapibloc1/bloc/verifyuser_cifnum/verify_cifnum_bloc.dart';
import 'package:flutterapibloc1/bloc/wildid/wildid_bloc.dart';
import 'package:flutterapibloc1/data/services/activity_service.dart';
import 'package:flutterapibloc1/data/services/connectivity_service.dart';
import 'package:flutterapibloc1/data/services/network_handler.dart';
import 'package:flutterapibloc1/data/services/wildid_service.dart';
import 'package:flutterapibloc1/presentation/utils/device_checker.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => ActivityService());
  sl.registerLazySingleton(() => ConnectivityService());
  sl.registerLazySingleton(() => NetworkHandler());
  sl.registerLazySingleton(() => WildidService());
  sl.registerLazySingleton(() => DeviceChecker());
  sl.registerFactory(() => ButtontxtBloc());
  sl.registerFactory(() => BlackjackkBloc());
  sl.registerFactory(() => SecscreenBloc());
  sl.registerFactory(() => TxtfieldBloc());
  sl.registerFactory(() => LoginnBloc(networkHandler: sl()));
  sl.registerFactory(() => WildidBloc(wildidService: sl()));
  sl.registerFactory(() => HomeBloc(activityService: sl()));
  sl.registerFactory(() => DeviceinfoBloc(deviceChecker: sl()));
  sl.registerFactory(() => VerifyCifnumBloc());
  sl.registerFactory(() => TrialBloc());
}
