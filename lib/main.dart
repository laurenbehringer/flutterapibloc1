import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/buttontxt/buttontxt_bloc.dart';
import 'package:flutterapibloc1/bloc/home_bloc/home_bloc.dart';
import 'package:flutterapibloc1/bloc/secscree/secscreen_bloc.dart';
import 'package:flutterapibloc1/bloc/wildid/wildid_bloc.dart';
import 'package:flutterapibloc1/data/services/activity_service.dart';
import 'package:flutterapibloc1/data/services/connectivity_service.dart';
import 'package:flutterapibloc1/data/services/wildid_service.dart';
import 'package:flutterapibloc1/injection_container.dart' as di;
import 'package:flutterapibloc1/injection_container.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:flutterapibloc1/presentation/routes/routes.dart';
import 'package:flutterapibloc1/presentation/screens/home/home.dart';
import 'package:flutterapibloc1/presentation/screens/wildid/wildid_screen.dart';
import 'package:provider/provider.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final secScreenBloc = sl<SecscreenBloc>();
  final buttontxtBloc = sl<ButtontxtBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(
            create: (context) => ActivityService()
        ),
        RepositoryProvider(
            create: (context) => ConnectivityService()
        ),
        RepositoryProvider(
            create: (_) => WildidService()
        ),
        BlocProvider(create: (_) => secScreenBloc),
        BlocProvider(create: (_) => buttontxtBloc),

        BlocProvider(create: (context) => HomeBloc(
          RepositoryProvider.of<ActivityService>(context),
          RepositoryProvider.of<ConnectivityService>(context),
        )),

        BlocProvider(create: (context) => WildidBloc(
          RepositoryProvider.of<WildidService>(context),
        )..add(LoadWildidApiEvent())
        ),

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
