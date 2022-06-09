import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutterapibloc1/data/models/activity_api.dart';
import 'package:http/http.dart' as http;

class TwitchAPI {
  late final http.Client _client;
  Future<String> getDefaultToken() async {
    final url = Uri(
      scheme: 'https',
      host: 'id.twitch.tv',
      path: '/oauth2/token',
      queryParameters: {
        'client_id': 'CLIENT_ID',
        'client_secret': 'SECRET',
        'grant_type': 'client_credentials',
      },
    );
    print("WKWKWKWKWKKWKWWK ${url}");

    final response = await _client.post(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['access_token'];
    } else {
      return Future.error('Failed to get default token.');
    }
  }
}