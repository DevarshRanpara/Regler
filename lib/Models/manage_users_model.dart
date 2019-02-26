import 'dart:convert';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:flutter_app/Classes/institute.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Classes/gen_string.dart';
import 'package:http/http.dart' as http;

class ManageUsersModel {
  void deleteUser(UserData user) async {
    String url = GenerateString.genStringDelete(user.id.toString());
    var res = await http.get(Uri.encodeFull(url));
    print(res.body.toString());
  }

  void chhangeLimit(UserData user, String limit) async {
    String url = GenerateString.genStringChLimit(user.id.toString(), limit);
    var res = await http.get(Uri.encodeFull(url));
    print(res.body.toString());
  }

  Future<String> addUser(String uname,int institute,int limit) async {
    String url=GenerateString.generateStringAddUser(uname,institute.toString(),limit.toString());
    var res = await http.get(Uri.encodeFull(url));
    return res.body.toString();
  }

  getInstituteList() async {
    String url = GenerateString.generateStringListIns();
    var response = await http.get(
      Uri.encodeFull(url),
    );
    List data = jsonDecode(response.body);
    print(data.toString());
    for (int i = 0; i < data.length; i++) {
      Institute building = Institute(
        id: int.parse(data[i]['id']),
        name: data[i]['name'],
        director: data[i]['director'],
      );

      Preferances.institutes.add(building);
    }
  }

  Future<bool> blockUser(UserData user) async {
    String url = GenerateString.genStringBlock(user.id.toString());

    var res = await http.get(
      Uri.encodeFull(url),
    );
    if (res.body.toString() == 'success') {
      return true;
    } else {
      return false;
    }
  }

  Future<List<UserData>> getData() async {
    List<UserData> user = new List<UserData>();
    String url = GenerateString.genStringMngUsers();
    var response = await http.get(
      Uri.encodeFull(url),
    );

    if (response.body.toString() == 'no_data') {
      return user;
    }

    List data = jsonDecode(response.body);

    for (int i = 0; i < data.length; i++) {
      bool f = false;

      if (data[i]['isblocked'] == '1') {
        f = true;
      }

      UserData userData = UserData(
        id: int.parse(data[i]['id']),
        name: data[i]['u_name'],
        // institute: data[i]['institute'],
        institute: data[i]['name'],
        url: data[i]['image_url'],
        role: data[i]['type'],
        isBlcked: f,
        limit: int.parse(data[i]['user_limit']),
        used: int.parse(data[i]['user_use']),
        bal: int.parse(data[i]['balence']),
      );
      user.add(userData);
    }
    if (Preferances.role == 'admin') {
      await getInstituteList();
    }

    return user;
  }
}
