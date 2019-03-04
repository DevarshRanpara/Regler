import 'dart:convert';
import 'package:flutter_app/Classes/gen_string.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/Classes/institute.dart';
import 'package:http/http.dart' as http;

class MngRoomAdminModel {
  List<Room> rooms = List<Room>();

  Future<List<Institute>> getData() async {
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
    print(response.body.toString());
    List data = jsonDecode(response.body);

    for (int i = 0; i < data.length; i++) {
      rooms = await getRoomData(int.parse(data[i]['id']));
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
    //print(institutes.toString());
    return institutes;
  }

  Future<List<Room>> getRoomData(int id) async {
    List<Room> rooms = List<Room>();

    String url = GenerateString.genStringGetRooms(id);

    http.Response response;
    try {
      response = await http.get(
        Uri.encodeFull(url),
      );
    } catch (e) {
      print(e.toString());
    }
    if (response == null) {
      return null;
    }
    print(response.body.toString());

    List data;

    if (response.body.toString() == 'no_data') {
      return null;
    } else {
      data = jsonDecode(response.body);
    }

    for (int i = 0; i < data.length; i++) {
      Room room = Room(
          id: int.parse(data[i]['id']),
          name: data[i]['room_no'],
          isBlocked: false,
          institute: data[i]['institute']);
      rooms.add(room);
    }

    return rooms;
  }
}
