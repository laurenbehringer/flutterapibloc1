import 'package:flutterapibloc1/data/models/activity_api.dart';
import 'package:http/http.dart' as http;


class ActivityService{
  Future<ActivityApi> getActivityApi() async {
    var url = Uri.parse("https://www.boredapi.com/api/activity");
    var response = await http.get(url);
    final activity = activityApiFromJson(response.body);
    return activity;
  }
}