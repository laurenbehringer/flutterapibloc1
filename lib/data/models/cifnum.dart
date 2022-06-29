import 'dart:convert';

VerifyUserCifNum verifyUserCifNumFromJson(String str) => VerifyUserCifNum.fromJson(json.decode(str));

String verifyUserCifNumToJson(VerifyUserCifNum data) => json.encode(data.toJson());

class VerifyUserCifNum {
  VerifyUserCifNum({
    required this.activationCode,
    required this.smsNumber,
    required this.sessionId,
    required this.phonenumber,
    required this.emailAddress,
    required this.fullName,
    required this.cifNum,
    required this.activationId,
    required this.waNumber,
  });

  String activationCode;
  String smsNumber;
  String sessionId;
  String phonenumber;
  String emailAddress;
  String fullName;
  String cifNum;
  String activationId;
  String waNumber;

  factory VerifyUserCifNum.fromJson(Map<String, dynamic> json) => VerifyUserCifNum(
    activationCode: json["activationCode"],
    smsNumber: json["smsNumber"],
    sessionId: json["sessionID"],
    phonenumber: json["phonenumber"],
    emailAddress: json["emailAddress"],
    fullName: json["fullName"],
    cifNum: json["cifNum"],
    activationId: json["activationId"],
    waNumber: json["waNumber"],
  );

  Map<String, dynamic> toJson() => {
    "activationCode": activationCode,
    "smsNumber": smsNumber,
    "sessionID": sessionId,
    "phonenumber": phonenumber,
    "emailAddress": emailAddress,
    "fullName": fullName,
    "cifNum": cifNum,
    "activationId": activationId,
    "waNumber": waNumber,
  };
}
