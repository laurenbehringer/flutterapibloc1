import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:flutterapibloc1/injection_container.dart' as di;
import 'package:flutterapibloc1/injection_container.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:flutterapibloc1/presentation/routes/routes.dart';
import 'package:flutterapibloc1/presentation/screens/blackjack/bloc/blackjack_test_bloc.dart';
import 'package:flutterapibloc1/presentation/screens/blackjack/bloc/set_balance_bloc.dart';
import 'package:flutterapibloc1/presentation/screens/home/home.dart';
import 'package:flutterapibloc1/presentation/screens/wildid/wildid_screen.dart';
import 'package:flutterapibloc1/presentation/utils/device_checker.dart';
import 'package:provider/provider.dart';
import 'dart:io' show HttpClient, Platform;

void main() {
  di.init();
  runApp(MyApp());
}

Alice alice = Alice(
  showNotification: true,
  showInspectorOnShake: true,
  darkTheme: false,
  maxCallsCount: 1000,
);

class MyApp extends StatelessWidget {
  final secScreenBloc = sl<SecscreenBloc>();
  final buttontxtBloc = sl<ButtontxtBloc>();
  final txtfieldBloc = sl<TxtfieldBloc>();
  final loginBloc = sl<LoginnBloc>();
  final wildidBloc = sl<WildidBloc>();
  final homeBloc = sl<HomeBloc>();
  final deviceinfoBloc = sl<DeviceinfoBloc>();
  final verifyUserCifnum = sl<VerifyCifnumBloc>();
  final trialBloc = sl<TrialBloc>();
  final blackJackBloc = sl<BlackjackkBloc>();
  final blackJackTestBloc = sl<BlackjackTestBloc>();
  final setBalanceBloc = sl<SetBalanceBloc>();

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
        BlocProvider(create: (_) => trialBloc),
        BlocProvider(create: (_) => blackJackBloc),
        BlocProvider(create: (_) => blackJackTestBloc),
        BlocProvider(create: (_) => setBalanceBloc),
      ],
      child: MaterialApp(
          onGenerateRoute: Routes().onGenerateRoute,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          navigatorKey: alice.getNavigatorKey(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ).copyWith(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: ZoomPageTransitionsBuilder(),
              },
            ),
          ),
          home: HomeScreen()),
    );
  }
}
