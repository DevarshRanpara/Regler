import 'package:flutter_app/Classes/room.dart';
class MngRoomDirModel
{
  List<Room> rooms;
  MngRoomDirModel()
  {
    rooms=[
      Room(name: "101"),
      Room(name: "102"),
      Room(name: "103"),
      Room(name: "104"),
      Room(name: "105"),
      Room(name: "106")
    ];
  }
  List<Room> getData(){
    return rooms;
  }
}