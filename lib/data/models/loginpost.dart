import 'dart:convert';
import 'dart:math';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
  Person({
    required this.fullName,
    required this.cifnum,
    required this.email,
    required this.phonenum,
    required this.sessionId,
    required this.loginDateTime,
    required this.hashUserName
  });

  String fullName;
  String cifnum;
  String email;
  String phonenum;
  String sessionId;
  String loginDateTime;
  String hashUserName;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    fullName: json["full_name"],
    cifnum: json["cifnum"],
    email: json["email"],
    phonenum: json["phonenum"],
    sessionId: json["sessionID"],
    loginDateTime: json["loginDateTime"],
    hashUserName: json["hashUserName"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "cifnum": cifnum,
    "email": email,
    "phonenum": phonenum,
    "sessionID": sessionId,
    "loginDateTime": loginDateTime,
    "hashUserName": hashUserName,
  };
}
