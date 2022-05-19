import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/data/services/activity_service.dart';
import 'package:flutterapibloc1/data/services/connectivity_service.dart';
import 'package:flutterapibloc1/presentation/screens/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          RepositoryProvider(
              create: (context) => ActivityService()
          ),
          RepositoryProvider(
              create: (context) => ConnectivityService()
          ),
          /*BlocProvider(
            create: (_) => HomeBloc(),
          ),*/
        ],
        child: HomeScreen(),
      )
    );
  }
}
