import 'package:flutterapibloc1/bloc/buttontxt/buttontxt_bloc.dart';
import 'package:flutterapibloc1/bloc/secscree/secscreen_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async{
  sl.registerFactory(() => ButtontxtBloc());
}