import 'package:flutter/material.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/Styles.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/blackjack_texts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeStyles().bjCol,
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blue,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Version",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      Text("V1.1",
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Text("About BlackJack", style: ThemeStyles().valueHeadingText),
                SizedBox(height: 20),
                Text(BJText().aboutBJText,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                SizedBox(height: 20),
                Text("About App", style: ThemeStyles().valueHeadingText),
                SizedBox(height: 20),
                Text(BJText().aboutAppText,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("View project on github",
                        style: ThemeStyles().valueHeadingText),
                    ElevatedButton(
                      onPressed: () {
                        launchUrl(Uri.parse("https://flutter.io"));
                      },
                      child: Icon(Icons.chevron_right),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
