import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutterapibloc1/data/models/wildid_api.dart';

class WildidService{
  var url = Uri.parse('https://laurenbehringer.github.io/news.json');
  Future<WildidApi> getWildidAPI() async{
    try{
      var response = await Dio().get("https://laurenbehringer.github.io/news.json");
      // var jsonData = response.data as Map<String, dynamic>;
      // var articles = jsonData['articles'] as List<dynamic>;
      // List<Article> larticles = [];
      // articles.forEach((article) {
      //   larticles.add(Article.fromJson(article));
      // });
      print("HEREEEE ${response.data}");
      final wildid = wildidApiFromJson(jsonEncode(response.data));
      return wildid;
    } catch(e){
      throw Exception(e.toString());
    }
  }
}