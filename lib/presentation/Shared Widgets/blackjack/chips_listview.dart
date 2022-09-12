import 'package:flutter/material.dart';

Widget ChipsListView(BuildContext context, TextEditingController txt) {
  return ListView(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    children: [
      GestureDetector(
        child: Image.asset(
          "assets/coins/1.png",
          scale: 10,
        ),
        onTap: () {
          txt.text = "1";
        },
      ),
      GestureDetector(
        child: Image.asset(
          "assets/coins/5.png",
          scale: 10,
        ),
        onTap: () {
          txt.text = "5";
        },
      ),
      GestureDetector(
        child: Image.asset(
          "assets/coins/10.png",
          scale: 10,
        ),
        onTap: () {
          txt.text = "10";
        },
      ),
      GestureDetector(
        child: Image.asset(
          "assets/coins/20.png",
          scale: 10,
        ),
        onTap: () {
          txt.text = "20";
        },
      ),
      GestureDetector(
        child: Image.asset(
          "assets/coins/50.png",
          scale: 10,
        ),
        onTap: () {
          txt.text = "50";
        },
      ),
      GestureDetector(
        child: Image.asset(
          "assets/coins/100.png",
          scale: 10,
        ),
        onTap: () {
          txt.text = "100";
        },
      ),
      GestureDetector(
        child: Image.asset(
          "assets/coins/250.png",
          scale: 10,
        ),
        onTap: () {
          txt.text = "250";
        },
      ),
      GestureDetector(
        child: Image.asset(
          "assets/coins/500.png",
          scale: 10,
        ),
        onTap: () {
          txt.text = "500";
        },
      ),
      GestureDetector(
        child: Image.asset(
          "assets/coins/1000.png",
          scale: 10,
        ),
        onTap: () {
          txt.text = "1000";
        },
      ),
    ],
  );
}
