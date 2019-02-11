import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:flutter_app/Classes/gen_string.dart';

class LoginModel {
  String _userid, _password;
  final String method = 'login';
  LoginModel(this._userid, this._password);

  Future<String> auth() async {
    
    String url =GenerateString.genStringLogin(method, _userid, _password);

    var response = await http.get(
      Uri.encodeFull(url),
    );

    //print(response.body);

    //List data=jsonDecode(response.body);
    if (response.body.toString() == 'invalid') {
      return 'invalid';
    } else {
      List data = jsonDecode(response.body);
      Preferances.id=int.parse(data[0]['id']);
      Preferances.name = data[0]['u_name'];
      Preferances.role = data[0]['type'];
      Preferances.imgurl = data[0]['image_url'];
      print(data[0]['type']);
      return data[0]['type'];
    }
  }
}

// String auth() {
//     if (_userid == 'user' && _password == "password1") {
//       return 'user';
//     } else if (_userid == 'admin' && _password == "password1") {
//       return 'admin';
//     } else if (_userid == 'director' && _password == "password1") {
//       return 'director';
//     } else {
//       return "invalid";
//     }
//   }
