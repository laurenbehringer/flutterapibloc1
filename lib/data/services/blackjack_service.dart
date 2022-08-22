import 'package:dio/dio.dart';
import 'package:flutterapibloc1/data/models/blackjack/blackjack_response_model.dart';

class BJNetwork {
  static Map<String, String> _headers = {
    "Content-type": "application/json",
  };

  static var shuffleCards =
      "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1";

  static ShuffleCards() async {
    try {
      print("masuk shuffleCards");
      var response = await Dio().post(
        shuffleCards,
        options: Options(headers: _headers),
      );
      /*print(response.data);*/
      print("end ShuffleCards");
      //return BlackJackShuffleResponseModel.fromJson(response.data);
      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static DrawCards(
      {required String deck_id, required String draw_count}) async {
    String url =
        "https://deckofcardsapi.com/api/deck/${deck_id}/draw/?count=${draw_count}";
    print("heres the url = $url");
    try {
      print("masuk DrawCards");
      var response = await Dio().get(
        url,
      );
      //print(response.data);
      print("end ShuffleCards");
      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
