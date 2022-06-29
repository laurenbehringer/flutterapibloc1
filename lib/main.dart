import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/buttontxt/buttontxt_bloc.dart';
import 'package:flutterapibloc1/bloc/deviceInfo/deviceinfo_bloc.dart';
import 'package:flutterapibloc1/bloc/home_bloc/home_bloc.dart';
import 'package:flutterapibloc1/bloc/login/loginn_bloc.dart';
import 'package:flutterapibloc1/bloc/secscree/secscreen_bloc.dart';
import 'package:flutterapibloc1/bloc/txtfield/txtfield_bloc.dart';
import 'package:flutterapibloc1/bloc/verifyuser_cifnum/verify_cifnum_bloc.dart';
import 'package:flutterapibloc1/bloc/wildid/wildid_bloc.dart';
import 'package:flutterapibloc1/injection_container.dart' as di;
import 'package:flutterapibloc1/injection_container.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:flutterapibloc1/presentation/routes/routes.dart';
import 'package:flutterapibloc1/presentation/screens/home/home.dart';
import 'package:flutterapibloc1/presentation/screens/wildid/wildid_screen.dart';
import 'package:flutterapibloc1/presentation/utils/device_checker.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final secScreenBloc = sl<SecscreenBloc>();
  final buttontxtBloc = sl<ButtontxtBloc>();
  final txtfieldBloc = sl<TxtfieldBloc>();
  final loginBloc = sl<LoginnBloc>();
  final wildidBloc = sl<WildidBloc>();
  final homeBloc = sl<HomeBloc>();
  final deviceinfoBloc = sl<DeviceinfoBloc>();
  final verifyUserCifnum = sl<VerifyCifnumBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => secScreenBloc),
        BlocProvider(create: (_) => buttontxtBloc),
        BlocProvider(create: (_) => txtfieldBloc),
        BlocProvider(create: (_) => wildidBloc),
        BlocProvider(create: (_) => loginBloc),
        BlocProvider(create: (_) => homeBloc),
        BlocProvider(create: (_) => deviceinfoBloc),
        BlocProvider(create: (_) => verifyUserCifnum),
      ],
      child: MaterialApp(
          onGenerateRoute: Routes().onGenerateRoute,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen()),
    );
  }
}
