import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginModel {

  

  String _userid, _password;
  LoginModel(this._userid, this._password);

  Future<String> auth() async
  {
    String url='https://devicemanagament.000webhostapp.com/web_service.php?uname='+_userid+'&pass='+_password;
    var response= await http.get(
      Uri.encodeFull(url),
      );

    //print(response.body);

    //List data=jsonDecode(response.body);
    if(response.body.toString()=='invalid')
    {
      return 'invalid';
    }
    else
    {
      List data=jsonDecode(response.body);
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