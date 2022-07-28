import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:flutterapibloc1/presentation/screens/azlistview/azlistview_screen.dart';
import 'package:flutterapibloc1/presentation/screens/buttonandtxt/buttonandtxt_screen.dart';
import 'package:flutterapibloc1/presentation/screens/contacts/contacts_screen.dart';
import 'package:flutterapibloc1/presentation/screens/draggable/draggable.dart';
import 'package:flutterapibloc1/presentation/screens/home/home.dart';
import 'package:flutterapibloc1/presentation/screens/redbankAPI/redbankapi1.dart';
import 'package:flutterapibloc1/presentation/screens/searchmovies/searchcountries_screen.dart';
import 'package:flutterapibloc1/presentation/screens/searchmovies/searchmovies_screen.dart';
import 'package:flutterapibloc1/presentation/screens/secscreen/secscreen.dart';
import 'package:flutterapibloc1/presentation/screens/trialstuff.dart';
import 'package:flutterapibloc1/presentation/screens/txtfield/txtfield2_screen.dart';
import 'package:flutterapibloc1/presentation/screens/txtfield/txtfield_screen.dart';
import 'package:flutterapibloc1/presentation/screens/wildid/wildid_screen.dart';

import '../../stfl.dart';

class Routes {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
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
      case redbankApiScreen:
        return MaterialPageRoute(
          builder: (_) => RedbankApi(),
        );
      case trialScreen:
        return MaterialPageRoute(
          builder: (_) => Trial(),
        );
      case aliceScreen:
        return MaterialPageRoute(
          builder: (_) => Alice(),
        );
      case searchScreen:
        return MaterialPageRoute(
          builder: (_) => SearchPage(),
        );
      case countryScreen:
        return MaterialPageRoute(
          builder: (_) => CountryScreen(),
        );
      case contactsScreen:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(),
        );
      case azlistviewScreen:
        return MaterialPageRoute(
          builder: (_) => AzListViewScreen(),
        );
      default:
        throw ('This route name does not exit');
    }
  }
}
