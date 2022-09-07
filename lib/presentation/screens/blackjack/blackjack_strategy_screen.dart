import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/Styles.dart';

class BlackJackStrategy extends StatefulWidget {
  const BlackJackStrategy({Key? key}) : super(key: key);

  @override
  State<BlackJackStrategy> createState() => _BlackJackStrategyState();
}

class _BlackJackStrategyState extends State<BlackJackStrategy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1A5B1F),
        appBar: AppBar(
          backgroundColor: Color(0xFF1A5B1F),
          centerTitle: true,
          title: Text("Strategy"),
          elevation: 0,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lightbulb_outline,
                  color: Colors.green.shade700, size: 70),
              SizedBox(height: 20),
              Text("Strategy", style: ThemeStyles().valueHeadingText),
              SizedBox(height: 20),
              Text(
                "The Basic Strategy for your current Blackjack Rules:",
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              CachedNetworkImage(
                imageUrl: "https://i.ibb.co/QDFfkcw/IMG-20220907-153034.jpg",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ],
          ),
        ));
  }
}
