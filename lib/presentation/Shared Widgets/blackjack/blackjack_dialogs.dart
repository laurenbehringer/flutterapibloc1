import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/Styles.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/blackjack/AppBar.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/blackjack/chips_listview.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:lottie/lottie.dart';

class BJDialogs {
  static var txt = TextEditingController();
  static final _formKey = GlobalKey<FormState>();

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

  static Future<void> showMyLoseDialog(context) async {
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
            content: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            children: [
              Text('Drawed', style: ThemeStyles().dialogHeadingDraw),
              Lottie.asset('assets/draw.json'),
              Text('You Drew -_-'),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width / 1.8,
                height: 40,
                child: ElevatedButton(
                  child: const Text('Continue'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.yellow.shade700, shape: StadiumBorder()),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacementNamed(context, blackjacScreen);
                  },
                ),
              )
            ],
          ),
        ));
      },
    );
  }

  static Future<void> showBetDialog(context, Function bet, temp) async {
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
              SizedBox(height: 20),
              Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ChipsListView(context, txt)),
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
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
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
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Value is empty';
                            }
                            if (int.parse(text) < 10 ||
                                int.parse(text) > 1000) {
                              return 'Please enter correct bet';
                            }
                            if (int.parse(text) > temp) {
                              return 'Bet cant be more than balance';
                            }
                            return null;
                          }),
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
                      child: Text("2x"),
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
                  final isValid = _formKey.currentState!.validate();
                  if (!isValid) {
                    return;
                  } else if (isValid) {
                    Navigator.pop(context);
                    bet(int.parse(txt.text));
                    txt.clear();
                  }
                },
                child: Text("Done"),
                style: ElevatedButton.styleFrom(primary: Colors.green.shade400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
