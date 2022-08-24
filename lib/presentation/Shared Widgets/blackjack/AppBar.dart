import 'package:flutter/material.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:flutterapibloc1/presentation/utils/soundEffects.dart';

AppBar bjAppbar(BuildContext context) {
  List<String> overflowMenu = [
    'Settings',
    'Card Counting',
    'Strategy',
    'About'
  ];

  void handleClick(String value) {
    switch (value) {
      case 'Settings':
        Navigator.pushNamed(context, homeScreen);
        break;
      case 'Card Counting':
        break;
    }
  }

  return AppBar(
    backgroundColor: Color(0xFF1A5B1F),
    automaticallyImplyLeading: false,
    elevation: 0,
    centerTitle: true,
    leading: Image.asset(
      "assets/logo.png",
    ),
    title: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF0A3E31),
        ),
        child: Center(child: Text("BlackJack"))),
    actions: [
      IconButton(
          onPressed: () {
            SoundEffect.changeVolume(0);
          },
          icon: Icon(Icons.share)),
      PopupMenuButton<String>(
        onSelected: handleClick,
        itemBuilder: (BuildContext context) {
          return overflowMenu.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
    ],
  );
}
