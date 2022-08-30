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
      appBar: AppBar(
        title: Text("XD?"),
      ),
      body: Center(
        child: FlipCard(
          fill: Fill.fillBack,
          // Fill the back side of the card to make in the same size as the front.
          direction: FlipDirection.HORIZONTAL,
          // default
          front: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://opengameart.org/sites/default/files/card%20back%20red.png"),
              ),
            ),
          ),
          back: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://i.pinimg.com/474x/44/d9/f5/44d9f504313cbbd650f4475cea9dbadf.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
