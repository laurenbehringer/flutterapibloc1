import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutterapibloc1/data/models/countries_response_model.dart';
import 'package:flutterapibloc1/data/models/wildid_api.dart';

class CountryService{
  Future<CountryResponseModel> getCountriesAPI() async{
    var url = Uri.parse('https://api.first.org/data/v1/countries');
    List<CountryResponseModel> trysu = [];
    try{
      var response = await Dio().get("https://api.first.org/data/v1/countries");
      // var jsonData = response.data as Map<String, dynamic>;
      // var articles = jsonData['articles'] as List<dynamic>;
      // List<Article> larticles = [];
      // articles.forEach((article) {
      //   larticles.add(Article.fromJson(article));
      // });
      print("HEREEEE ${response.data}");
      print(countryResponseModelFromJson(jsonEncode(response.data)));
      final countries = countryResponseModelFromJson(jsonEncode(response.data));
      trysu.add(countries);
      return countries;
    } catch(e){
      throw Exception(e.toString());
    }
  }
}