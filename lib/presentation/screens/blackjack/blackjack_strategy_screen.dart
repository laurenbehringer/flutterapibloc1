import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

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
      body: Text(""),
    );
  }
}
