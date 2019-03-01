import 'dart:convert';
import 'package:flutter_app/Classes/gen_string.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/Classes/institute.dart';
import 'package:http/http.dart' as http;

class MngRoomAdminModel {
  List<Institute> institutes=List<Institute>();
  List<Room> rooms;

  Future<List<Institute>> getData() async {
     rooms = [
      Room(name: "101"),
      Room(name: "102"),
      Room(name: "103"),
      Room(name: "104"),
      Room(name: "105")
    ];
    List<Institute> institutes = List<Institute>();
    String url = GenerateString.generateStringListIns();
    http.Response response;
    try {
      response = await http.get(
        Uri.encodeFull(url),
      );
    } catch (e) {
      print(e.toString());
    }
    List data = jsonDecode(response.body);

    for (int i = 0; i < data.length; i++) {
      
      bool f = false;
      if (data[i]['isblocked'] == '1') {
        f = true;
      }
      Institute building = Institute(
          id: int.parse(data[i]['id']),
          name: data[i]['name'],
          director: data[i]['director'],
          directorName: data[i]['u_name'],
          isBlocked: f,
          rooms: rooms,
          dirImgUrl: data[i]['image_url']);
      institutes.add(building);
    }
    // rooms.clear();
    print(institutes.toString());
    return institutes;
  }
}
