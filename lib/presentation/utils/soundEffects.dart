import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SoundEffect {
  static final musicplayer = new AudioPlayer();
  static final soundplayer = new AudioPlayer();

  static void playMain() async {
    await musicplayer.play(AssetSource('casino.mp3'));
  }

  static void stopSound() async {
    await musicplayer.stop();
  }

  static void changeVolume(double value) {
    musicplayer.setVolume(value);
  }

  static void dealCard() async {
    await soundplayer.play(AssetSource('dealCards.mp3'));
  }
}
