
import 'package:shared_preferences/shared_preferences.dart';

class SPHandler{

  static void setToken2(tokenValue) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', tokenValue);
  }


   static Future<void> setToken (tokenValue) async {
     final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', tokenValue);
  }


}