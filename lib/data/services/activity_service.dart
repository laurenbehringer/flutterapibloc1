import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutterapibloc1/data/models/activity_api.dart';
import 'package:http/http.dart' as http;

class ActivityService{
  Future<ActivityApi> getActivityApi() async {
    var url = Uri.parse("http://www.boredapi.com/api/activity");
    try{
      var response = await Dio().get("http://www.boredapi.com/api/activity",
      onReceiveProgress: (current, max) {
        print('$current - $max');
        }
      );
      print("WKWKWKWKWKWK ${response.data}");
      final activity = activityApiFromJson(jsonEncode(response.data));
      return activity;
    } catch(e){
      throw Exception(e.toString());
    }
  }
}