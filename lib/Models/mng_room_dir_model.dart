import 'dart:convert';

import 'package:flutter_app/Classes/gen_string.dart';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:http/http.dart' as http;

class MngRoomDirModel {
    Future<void> addRoom(String roomNo,String insid) async {
    String url = GenerateString.genStringAddRoom(roomNo,insid);
    http.Response response;
    try {
      response = await http.get(
        Uri.encodeFull(url),
      );
    } catch (e) {
      print(e.toString());
    }
    if (response.body.toString() == Strings.msgSuccess) {
      print(Strings.msgSuccess);
    }
  }

  Future<void> blockRoom(String id) async {
    String url = GenerateString.genStringBlockRoom(id);
    http.Response response;
    try {
      response = await http.get(
        Uri.encodeFull(url),
      );
    } catch (e) {
      print(e.toString());
    }
    if (response.body.toString() == Strings.msgSuccess) {
      print(Strings.msgSuccess);
    }
  }

  Future<List<Room>> getData() async {
    List<Room> rooms = List<Room>();

    String url =
        GenerateString.genStringGetRooms(int.parse(Preferances.instituteid));

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
