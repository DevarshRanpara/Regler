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
    String url = GenerateString.genStringLogin(method, _userid, _password);

    var response = await http.get(
      Uri.encodeFull(url),
    );
    
    if (response.body.toString() == 'invalid') {
      return 'invalid';
    } else if (response.body.toString() == 'blocked') {
      return 'blocked';
    } else {
      List data = jsonDecode(response.body);
      Preferances.id = int.parse(data[0]['id']);
      Preferances.name = data[0]['u_name'];
      Preferances.role = data[0]['type'];
      Preferances.instituteid = data[0]['institute'];
      Preferances.institute=data[0]['name'];
      Preferances.imgurl = data[0]['image_url'];
      Preferances.limit = data[0]['user_limit'];
      Preferances.use = data[0]['user_use'];
      Preferances.bal = data[0]['balence'];
      return data[0]['type'];
    }
  }
}