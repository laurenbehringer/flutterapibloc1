import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/buttontxt/buttontxt_bloc.dart';
import 'package:flutterapibloc1/bloc/home_bloc/home_bloc.dart';
import 'package:flutterapibloc1/bloc/secscree/secscreen_bloc.dart';
import 'package:flutterapibloc1/data/services/activity_service.dart';
import 'package:flutterapibloc1/data/services/connectivity_service.dart';
import 'package:flutterapibloc1/injection_container.dart' as di;
import 'package:flutterapibloc1/injection_container.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:flutterapibloc1/presentation/routes/routes.dart';
import 'package:flutterapibloc1/presentation/screens/buttonandtxt/buttonandtxt_screen.dart';
import 'package:flutterapibloc1/presentation/screens/home/home.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/secscreen/secscreen.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final secScreenBloc = sl<SecscreenBloc>();
  final buttontxtBloc = sl<ButtontxtBloc>();
  final activityService = sl<ActivityService>();
  final connectivityService = sl<ConnectivityService>();
  final homeBloc = sl<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(
          create: (_) => activityService,
        ),
        RepositoryProvider(
          create: (_) => connectivityService,
        ),
        BlocProvider(
          create: (_) => homeBloc..add(LoadActivityApiEvent()),
        ),
        BlocProvider(create: (_) => secScreenBloc),
        BlocProvider(create: (_) => buttontxtBloc),
      ],
      child: MaterialApp(
          onGenerateRoute: Routes().onGenerateRoute,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen()),
    );
  }
}
