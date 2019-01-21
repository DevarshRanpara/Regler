import 'package:shared_preferences/shared_preferences.dart';
//import 'dart:async';

class LoginModel {
  String _userid, _password;
  LoginModel(this._userid, this._password);

  void saveNamePrefs(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);
  }

  String auth() {
    if (_userid == 'user' && _password=="12345678" ) {
      saveNamePrefs("Devarsh");
      return 'user';
    } else if (_userid == 'admin' && _password=="password1" ) {
      return 'admin';
    } else if (_userid == 'director' && _password=="password1" ) {
      return 'director';
    } else {
      return "invalid";
    }
  }
}
