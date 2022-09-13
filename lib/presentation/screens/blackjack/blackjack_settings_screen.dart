import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/Styles.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:flutterapibloc1/presentation/screens/blackjack/blackjackScreens.dart';
import 'package:flutterapibloc1/presentation/screens/blackjack/bloc/set_balance_bloc.dart';
import 'package:flutterapibloc1/presentation/utils/soundEffects.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BJSettings extends StatefulWidget {
  const BJSettings({
    Key? key,
  }) : super(key: key);

  @override
  State<BJSettings> createState() => _BJSettingsState();
}

class _BJSettingsState extends State<BJSettings> {
  GlobalKey<BlackJacScreenState> _key = GlobalKey<BlackJacScreenState>();

  double _value = 50.0;
  bool isMuted = false;
  int modifiedBankroll = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A5B1F),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A5B1F),
        centerTitle: true,
        title: Text("Settings"),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BankRoll", style: ThemeStyles().valueHeadingText),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF0A3E31),
              ),
              child: TextField(
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
                  modifiedBankroll = int.parse(val);
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<SetBalanceBloc>(context)
                      .add(ResetBankrollEvent(modifiedBankroll));
                  Navigator.pushReplacementNamed(context, blackjacScreen);
                },
                child: Text(
                  "Reset Bankroll",
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade700, shape: StadiumBorder()),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Audio", style: ThemeStyles().valueHeadingText),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isMuted
                          ? SoundEffect.playMain()
                          : SoundEffect.stopSound();
                      isMuted = !isMuted;
                    });
                  },
                  child: Icon(isMuted ? Icons.volume_down : Icons.volume_off),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.shade700,
              ),
              child: SfSlider(
                min: 0.0,
                max: 100.0,
                value: _value,
                interval: 20,
                //showTicks: true,
                //showLabels: true,
                enableTooltip: true,
                minorTicksPerInterval: 1,
                activeColor: Colors.white,
                onChanged: (dynamic value) {
                  _value = value;
                  setState(() {
                    _value = value;
                    SoundEffect.changeVolume(_value / 100);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
