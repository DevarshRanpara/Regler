import 'dart:convert';
import 'package:flutter_app/Classes/gen_string.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/Classes/institute.dart';
import 'package:flutter_app/Models/mng_room_dir_model.dart';
import 'package:http/http.dart' as http;

class MngRoomAdminModel {
  MngRoomDirModel model = MngRoomDirModel();

  Future<void> blockRoom(String id) async {
    model.blockRoom(id);
  }

  Future<void> deleteRoom(String id) async {
    model.deleteRoom(id);
  }

  Future<List<Institute>> getData() async {
    List<Room> rooms = List<Room>();
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
      return rooms;
    }
    print(response.body.toString());

    List data;

    if (response.body.toString() == 'no_data') {
      return rooms;
    } else {
      data = jsonDecode(response.body);
    }

    for (int i = 0; i < data.length; i++) {
      bool f = false;
      if (data[i]['isblocked'] == '1') {
        f = true;
      }
      Room room = Room(
          id: int.parse(data[i]['id']),
          name: data[i]['room_no'],
          isBlocked: f,
          institute: data[i]['institute']);
      rooms.add(room);
    }

    return rooms;
  }
}
