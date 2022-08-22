import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:flutterapibloc1/presentation/screens/blackjack/blackjackScreens.dart';
import 'package:flutterapibloc1/presentation/utils/soundEffects.dart';

class BlackJackHome extends StatefulWidget {
  const BlackJackHome({Key? key}) : super(key: key);

  @override
  State<BlackJackHome> createState() => _BlackJackHomeState();
}

class _BlackJackHomeState extends State<BlackJackHome> {
  final player = new AudioPlayer();
  Color button = Color(0xFF0A3E31);

  @override
  void initState() {
    // TODO: implement initState
    player.setReleaseMode(ReleaseMode.loop);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //SoundEffect.playMain();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A5B1F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("BlackJack",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white,
                )),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              "assets/logo.png",
              scale: 1.5,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height * 0.08,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: button),
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, blackjacScreen);
                  },
                  child: Text("Play")),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height * 0.08,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: button),
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, blackjacScreen);
                  },
                  child: Text("Settings")),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height * 0.08,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, blackjacScreen);
                  },
                  child: Text("Quit")),
            )
          ],
        ),
      ),
    );
  }
}
