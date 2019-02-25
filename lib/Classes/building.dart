import 'package:flutter_app/Classes/room.dart';

class Building {
  int id;
  String name;
  String director;
  String directorName;
  String dirImgUrl;
  bool isBlocked;
  List<Room> rooms;
  Building({this.id, this.name, this.director,this.directorName,this.dirImgUrl, this.isBlocked, this.rooms});
}
