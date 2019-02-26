import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/Classes/institute.dart';

class MngRoomAdminModel {
  List<Institute> institutes;
  List<Room> rooms;

  MngRoomAdminModel() {
    rooms = [
      Room(name: "101"),
      Room(name: "102"),
      Room(name: "103"),
      Room(name: "104"),
      Room(name: "105")
    ];
    institutes = [
      Institute(name: "LJ MCA", rooms: rooms),
      Institute(name: "LJ MBA", rooms: rooms),
      Institute(name: "LJ Engg", rooms: rooms),
      Institute(name: "LJ Arts", rooms: rooms),
      Institute(name: "LJ Law", rooms: rooms)
    ];
  }
  List<Institute> getData() {
    return institutes;
  }
}
