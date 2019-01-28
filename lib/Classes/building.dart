import 'package:flutter_app/Classes/room.dart';

class Building {
  int id;
  String name;
  //User dir
  String director;
  bool isBlocked;
  List<Room> rooms;
  Building({this.id, this.name, this.director, this.isBlocked, this.rooms});
}
