import 'dart:convert';

import 'package:flutter_app/Classes/gen_string.dart';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:http/http.dart' as http;

class MngRoomDirModel {
  Future<List<Room>> getData() async {
    
    List<Room> rooms = List<Room>();

    String url = GenerateString.genStringGetRooms(int.parse(Preferances.instituteid));
    
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

    if(response.body.toString()=='no_data'){
      return null;
    }
    else{
    data = jsonDecode(response.body);
    }

    for (int i = 0; i < data.length; i++) {
      Room room = Room(
          id: int.parse(data[i]['id']),
          name: data[i]['room_no'],
          isBlocked: false,
          institute: data[i]['institute']
          );
      rooms.add(room);
    }

    return rooms;
  }
}
