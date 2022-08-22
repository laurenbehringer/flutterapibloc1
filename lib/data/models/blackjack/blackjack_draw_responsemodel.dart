// To parse this JSON data, do
//
//     final blackJackDrawCardResponseModel = blackJackDrawCardResponseModelFromJson(jsonString);

import 'dart:convert';

BlackJackDrawCardResponseModel blackJackDrawCardResponseModelFromJson(
        String str) =>
    BlackJackDrawCardResponseModel.fromJson(json.decode(str));

String blackJackDrawCardResponseModelToJson(
        BlackJackDrawCardResponseModel data) =>
    json.encode(data.toJson());

class BlackJackDrawCardResponseModel {
  BlackJackDrawCardResponseModel({
    required this.success,
    required this.deckId,
    required this.cards,
    required this.remaining,
  });

  bool success;
  String deckId;
  List<Card> cards;
  int remaining;

  factory BlackJackDrawCardResponseModel.fromJson(Map<String, dynamic> json) =>
      BlackJackDrawCardResponseModel(
        success: json["success"],
        deckId: json["deck_id"],
        cards: List<Card>.from(json["cards"].map((x) => Card.fromJson(x))),
        remaining: json["remaining"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "deck_id": deckId,
        "cards": List<dynamic>.from(cards.map((x) => x.toJson())),
        "remaining": remaining,
      };
}

class Card {
  Card({
    required this.code,
    required this.image,
    required this.images,
    required this.value,
    required this.suit,
  });

  String code;
  String image;
  Images images;
  String value;
  String suit;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        code: json["code"],
        image: json["image"],
        images: Images.fromJson(json["images"]),
        value: json["value"],
        suit: json["suit"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "image": image,
        "images": images.toJson(),
        "value": value,
        "suit": suit,
      };
}

class Images {
  Images({
    required this.svg,
    required this.png,
  });

  String svg;
  String png;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        svg: json["svg"],
        png: json["png"],
      );

  Map<String, dynamic> toJson() => {
        "svg": svg,
        "png": png,
      };
}
