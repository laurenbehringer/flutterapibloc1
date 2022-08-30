import 'package:flutter/material.dart';
import 'package:flutterapibloc1/presentation/screens/blackjack/blackjackScreens.dart';

class BJDialogs {
  static Future<void> showMyWinDialog(context) async {
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
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showMyLoseDialog(context) async {
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
              },
            ),
          ],
        );
      },
    );
  }
}
