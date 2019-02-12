import 'dart:convert';

import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Classes/gen_string.dart';
import 'package:http/http.dart' as http;

class ManageUsersModel {
  List<UserData> user = new List<UserData>();
  String url = GenerateString.genStringMngUsers();

  List<UserData> getData() {
    return user;
  }

  void addUser(String name, String ins, int limit) {
    user.add(UserData(
        name: name,
        institute: ins,
        limit: limit,
        url: "",
        used: 0,
        bal: 0,
        isBocked: false));
  }

  Future<bool> setData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    List data = jsonDecode(response.body);

    print(response.body);

    for(int i=0;i<data.length;i++){
      UserData userData=UserData(
        id: data[i]['id'],
        name: data[i]['u_name'],
        institute: data[i]['institute'],
        url: data[i]['image_url'],
        limit: int.parse(data[i]['user_limit']) ,
        used: int.parse(data[i]['user_use']),
        bal: int.parse(data[i]['balence']), 
        isBocked:false
      );
      user.add(userData);
    }

    return true;

  }
}
