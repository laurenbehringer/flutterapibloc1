import 'package:flutter/material.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';

Future<bool> OnWillPop(context /*, Function function*/) async {
  return (await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Are you sure?'),
          content: new Text('Do you want to Exit?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: new Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, blackjackhomeScreen);
                //function();
              },
              child: new Text('Yes'),
            ),
          ],
        ),
      )) ??
      false;
}
