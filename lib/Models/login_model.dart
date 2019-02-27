import 'dart:async';
import 'package:flutter_app/Classes/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:flutter_app/Classes/gen_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModel {
  final String method = 'login';

  Future<String> auth(_userid, _password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String url = GenerateString.genStringLogin(method, _userid, _password);
    http.Response response;

    try {
      response = await http.get(
        Uri.encodeFull(url),
      );
    } catch (e) {
      print(e.toString());
      return Strings.internetEr;
    }

    if (response.body.toString() == 'invalid') {
      return 'invalid';
    } else if (response.body.toString() == 'blocked') {
      return 'blocked';
    } else {
      List data = jsonDecode(response.body);
      prefs.setInt(Strings.keyId, int.parse(data[0]['id']));
      prefs.setString(Strings.keyName, data[0]['u_name']);
      prefs.setString(Strings.keyRole, data[0]['type']);
      prefs.setString(Strings.keyInsId, data[0]['institute']);
      prefs.setString(Strings.keyIns, data[0]['name']);
      prefs.setString(Strings.keyImgUrl, data[0]['image_url']);
      prefs.setString(Strings.keyLimit, data[0]['user_limit']);
      prefs.setString(Strings.keyUse, data[0]['user_use']);
      prefs.setString(Strings.keyBal, data[0]['balence']);
      prefs.setBool(Strings.keyIsLoggedin, true);

      Preferances.id = int.parse(data[0]['id']);
      Preferances.name = data[0]['u_name'];
      Preferances.role = data[0]['type'];
      Preferances.instituteid = data[0]['institute'];
      Preferances.institute = data[0]['name'];
      Preferances.imgurl = data[0]['image_url'];
      Preferances.limit = data[0]['user_limit'];
      Preferances.use = data[0]['user_use'];
      Preferances.bal = data[0]['balence'];

      print(data[0]['type']);
      return data[0]['type'];
    }
  }
}
