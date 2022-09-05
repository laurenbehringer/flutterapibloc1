import 'package:flutter/material.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/blackjack/AppBar.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:flutterapibloc1/presentation/screens/blackjack/blackjackScreens.dart';

class BJDialogs {
  static Future<void> showMyWinDialog(context /*, Future<int> set*/) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You WON'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Congratulations You WON'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
                /*BaseAppBar.initializePreference(
                    playerBal == null ? 1000 + 100 : playerBal + 100);*/
                Navigator.pushReplacementNamed(context, blackjacScreen);
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showMyLoseDialog(
      context, playerBal /*, Future<int> set*/) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You Lost'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('YOU LOSE :('),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
                /*BaseAppBar.initializePreference(
                    playerBal == null ? 1000 - 100 : playerBal - 100);*/
                Navigator.pushReplacementNamed(context, blackjacScreen);
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showMyDrawDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Drawed'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('YOU Drew, No one wins'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, blackjacScreen);
              },
            ),
          ],
        );
      },
    );
  }
}
