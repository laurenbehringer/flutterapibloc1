// To parse this JSON data, do
//
//     final blackJackShuffleResponseModel = blackJackShuffleResponseModelFromJson(jsonString);

import 'dart:convert';

BlackJackShuffleResponseModel blackJackShuffleResponseModelFromJson(
        String str) =>
    BlackJackShuffleResponseModel.fromJson(json.decode(str));

String blackJackShuffleResponseModelToJson(
        BlackJackShuffleResponseModel data) =>
    json.encode(data.toJson());

class BlackJackShuffleResponseModel {
  BlackJackShuffleResponseModel({
    required this.success,
    required this.deckId,
    required this.shuffled,
    required this.remaining,
    required this.error,
  });

  bool success;
  String deckId;
  bool shuffled;
  int remaining;
  String error;

  factory BlackJackShuffleResponseModel.fromJson(Map<String, dynamic> json) =>
      BlackJackShuffleResponseModel(
        success: json["success"],
        deckId: json["deck_id"],
        shuffled: json["shuffled"],
        remaining: json["remaining"],
        error: json["error"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "deck_id": deckId,
        "shuffled": shuffled,
        "remaining": remaining,
        "error": error,
      };
}
