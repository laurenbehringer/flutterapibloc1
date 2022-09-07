import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/Styles.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/blackjack/AppBar.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:lottie/lottie.dart';

class BJDialogs {
  static var txt = TextEditingController();

  static Future<void> showMyWinDialog(context /*, Future<int> set*/) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('You Won', style: ThemeStyles().dialogHeadingWin),
                Lottie.asset('assets/win.json'),
                Text('YOU WON :)'),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text('Continue'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade700, shape: StadiumBorder()),
                    onPressed: () {
                      Navigator.of(context).pop();
                      /*BaseAppBar.initializePreference(
                    playerBal == null ? 1000 - 100 : playerBal - 100);*/
                      Navigator.pushReplacementNamed(context, blackjacScreen);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> showMyLoseDialog(
    context,
    /*playerBal*/ /*, Future<int> set*/
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('You Lost', style: ThemeStyles().dialogHeadingLose),
                Lottie.asset('assets/lose.json'),
                Text('YOU LOSE :('),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text('Continue'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade700, shape: StadiumBorder()),
                    onPressed: () {
                      Navigator.of(context).pop();
                      /*BaseAppBar.initializePreference(
                    playerBal == null ? 1000 - 100 : playerBal - 100);*/
                      Navigator.pushReplacementNamed(context, blackjacScreen);
                    },
                  ),
                )
              ],
            ),
          ),
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

  static Future<void> showBetDialog(context, Function bet) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
        backgroundColor: const Color(0xff1C5220),
        insetPadding: EdgeInsets.zero,
        content: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              children: [
                Center(
                    child: new Text(
                  "Place your bet",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        "assets/1.png",
                        scale: 10,
                      ),
                      onTap: () {
                        txt.text = "1";
                      },
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "assets/5.png",
                        scale: 10,
                      ),
                      onTap: () {
                        txt.text = "5";
                      },
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "assets/10.png",
                        scale: 10,
                      ),
                      onTap: () {
                        txt.text = "10";
                      },
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "assets/20.png",
                        scale: 10,
                      ),
                      onTap: () {
                        txt.text = "20";
                      },
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "assets/50.png",
                        scale: 10,
                      ),
                      onTap: () {
                        txt.text = "50";
                      },
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "assets/100.png",
                        scale: 10,
                      ),
                      onTap: () {
                        txt.text = "100";
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: const StadiumBorder(),
                            side: BorderSide(
                              width: 2,
                              color: Colors.white,
                            )),
                        child: Text("½"),
                        onPressed: () {
                          txt.text = (int.parse(txt.text) / 2).toString();
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF0A3E31),
                      ),
                      child: TextField(
                        controller: txt,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (val) {
                          bet(val);
                        },
                      ),
                    ),
                    Container(
                      width: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: const StadiumBorder(),
                            side: BorderSide(
                              width: 2,
                              color: Colors.white,
                            )),
                        child: Text("x2"),
                        onPressed: () {
                          txt.text = (int.parse(txt.text) * 2).toString();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Minumum \$10 | Maximum \$1000",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    bet(int.parse(txt.text));
                  },
                  child: Text("Done"),
                  style:
                      ElevatedButton.styleFrom(primary: Colors.green.shade400),
                )
              ],
            )),
      ),
    );
  }
}
