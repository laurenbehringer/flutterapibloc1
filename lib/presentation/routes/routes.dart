import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:flutterapibloc1/presentation/screens/buttonandtxt/buttonandtxt_screen.dart';
import 'package:flutterapibloc1/presentation/screens/draggable/draggable.dart';
import 'package:flutterapibloc1/presentation/screens/home/home.dart';
import 'package:flutterapibloc1/presentation/screens/secscreen/secscreen.dart';
import 'package:flutterapibloc1/presentation/screens/txtfield/txtfield2_screen.dart';
import 'package:flutterapibloc1/presentation/screens/txtfield/txtfield_screen.dart';
import 'package:flutterapibloc1/presentation/screens/wildid/wildid_screen.dart';

class Routes{
    Route<dynamic> onGenerateRoute (RouteSettings settings){
      switch (settings.name) {
        case homeScreen:
          return MaterialPageRoute(
            builder: (_) => HomeScreen(),
          );
        case buttontxt:
          return MaterialPageRoute(
            builder: (_) => ButtonTextScreen(),
          );
        case secScreen:
          return MaterialPageRoute(
            builder: (_) => SecScreen(),
          );
        case wildIdScreen:
          return MaterialPageRoute(
            builder: (_) => WildId(),
          );
        case txtfieldScreen:
          return MaterialPageRoute(
            builder: (_) => Txtfield(),
          );
        case txtfield2Screen:
          return MaterialPageRoute(
            builder: (_) => Txtfield2(),
          );
        case draggableScreen:
          return MaterialPageRoute(
            builder: (_) => DraggableScreen(),
          );
        default:
          throw('This route name does not exit');
      }
  }
}