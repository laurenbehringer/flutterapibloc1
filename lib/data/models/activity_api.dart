// To parse this JSON data, do
// final activityApi = activityApiFromJson(jsonString);

import 'dart:convert';

ActivityApi activityApiFromJson(String str) => ActivityApi.fromJson(json.decode(str));

String activityApiToJson(ActivityApi data) => json.encode(data.toJson());

class ActivityApi {
  ActivityApi({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  String activity;
  String type;
  int participants;
  dynamic price;
  String link;
  String key;
  dynamic accessibility;

  factory ActivityApi.fromJson(Map<String, dynamic> json) => ActivityApi(
    activity: json["activity"],
    type: json["type"],
    participants: json["participants"],
    price: json["price"],
    link: json["link"],
    key: json["key"],
    accessibility: json["accessibility"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "activity": activity,
    "type": type,
    "participants": participants,
    "price": price,
    "link": link,
    "key": key,
    "accessibility": accessibility,
  };
}
