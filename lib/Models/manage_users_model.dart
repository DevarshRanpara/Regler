import 'dart:convert';

import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Classes/gen_string.dart';
import 'package:http/http.dart' as http;

class ManageUsersModel {
  
  String url = GenerateString.genStringMngUsers();

  // List<UserData> getData() {
  //   return user;
  // }

  // void addUser(String name, String ins, int limit) {
  //   user.add(UserData(
  //       name: name,
  //       institute: ins,
  //       limit: limit,
  //       url: "",
  //       used: 0,
  //       bal: 0,
  //       isBocked: false));
  // }

  Future<List<UserData>> setData() async {
    List<UserData> user = new List<UserData>();
    var response = await http.get(
      Uri.encodeFull(url),
    );
    List data = jsonDecode(response.body);

    print(response.body);

    for (int i = 0; i < data.length; i++) {
      bool f = false;

      if (data[i]['isblocked'] == '1') {
        f = true;
      }

      UserData userData = UserData(
        id: int.parse(data[i]['id']),
        name: data[i]['u_name'],
        institute: data[i]['institute'],
        url: data[i]['image_url'],
        isBocked: f,
        limit: int.parse(data[i]['user_limit']),
        used: int.parse(data[i]['user_use']),
        bal: int.parse(data[i]['balence']),
      );
      user.add(userData);
    }
    return user;
  }
}
