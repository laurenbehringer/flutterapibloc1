import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterapibloc1/data/models/loginpost.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  var baseurl = "https://api.gateway.digi46.id/redbank/login";
  var redbankurl = Uri.parse("https://api.gateway.digi46.id/redbank/login");

  static Map<String, String> _body = {
    "userName": "admin",
    "password": "admin",
    "simSerialNumber": "f4cc5295bf21b382",
    "root": "NO",
    "CV": "5.5",
    "deviceType": "Xiaomi-MI 9",
    "osVersion": "Android 11",
    "token": "dKklq3gTY44:APA91bGUItr83NWKECaL0yODySW7_s50kOOV_PM4fKasW-vUksEcu0Givtpfe_O5gImLorO49G6P11Brbmm3hUVRF4exOf7Z3KgBe8CBq9U4Z6HXHZ__aHwiB8h4tQB2uO6vbsOCJMDy"
  };

  static Map<String, String> _headers = {
    "Content-type": "application/json",
    "apiKey": "lvZKs3X338WSrnjlJNFD6RHy8dAyFAqV",
  };


  static Future<Person?> dioPost () async{
    try{
      print("masuk pakkkk");
      var response = await Dio().post(
        "https://api.gateway.digi46.id/redbank/login",
        data: _body,
        options: Options(
          headers: _headers
        ),
      );
      print(response.data);
      return Person.fromJson(response.data);
    }
    catch (e){
      throw Exception(e.toString());
    }
  }

  // Future<http.Response> post() async {
  //   var response = await http.post(redbankurl,
  //     headers: headers,
  //     body: json.encode(body),
  //   );
  //   print("jinx league");
  //   Map<String, dynamic> output = json.decode(response.body);
  //   print(output);
  //   print(output["full_name"]);
  //   return response;
  // }


 /* Future get(String url) async {
    String? token = await storage.read(key: "token");
    url = formater(url);
    // /user/register
    var response = await http.get(url,
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);

      return json.decode(response.body);
    }
    print(response.body);
    print(response.statusCode);
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    String? token = await storage.read(key: "token");
    url = formater(url);
    print(body);
    var response = await http.post(
      url,
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> patch(String url, Map<String, String> body) async {
    String? token = await storage.read(key: "token");
    url = formater(url);
    print(body);
    var response = await http.patch(
      url,
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> post1(String url, var body) async {
    String? token = await storage.read(key: "token");
    url = formater(url);
    log.d(body);
    var response = await http.post(
      url,
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.StreamedResponse> patchImage(String url, String filepath) async {
    url = formater(url);
    String token = await storage.read(key: "token");
    var request = http.MultipartRequest('PATCH', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath("img", filepath));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token"
    });
    var response = request.send();
    return response;
  }*/

  String formater(String url) {
    return baseurl + url;
  }

  NetworkImage getImage(String imageName) {
    String url = formater("/uploads//$imageName.jpg");
    return NetworkImage(url);
  }
}
