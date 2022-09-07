import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/Styles.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/blackjack/blackjack_dialogs.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:flutterapibloc1/presentation/utils/soundEffects.dart';
import 'package:share_plus/share_plus.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final BuildContext context;
  final int Balance;

  BaseAppBar(
      {required this.context, required this.appBar, required this.Balance});

  List<String> overflowMenu = [
    'Settings',
    'Card Counting',
    'Strategy',
    'About'
  ];

  void handleClick(String value) {
    switch (value) {
      case 'Settings':
        //BJDialogs.showMyWinDialog(context);
        Navigator.pushNamed(context, blackjacksettingsScreen);
        break;
      case 'Card Counting':
        break;
      case 'Strategy':
        Navigator.pushNamed(context, blackjackStratScreen);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ThemeStyles().bjCol));
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
          child: Center(
            child: Text(Balance != null ? Balance.toString() : "100"),
            /* Text('\$${preferences?.getInt("playerbal") ?? 1000}'),*/
          )),
      actions: [
        IconButton(
            onPressed: () {
              Share.share(
                  'Check out Flutter App made by Millen https://millen.com');
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

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

/*
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
      case 'Strategy':
        Navigator.pushNamed(context, blackjackStratScreen);
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
}*/
