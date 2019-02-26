import 'package:flutter_app/Classes/room.dart';

class Institute {
  int id;
  String name;
  String director;
  String directorName;
  String dirImgUrl;
  bool isBlocked;
  List<Room> rooms;
  Institute({this.id, this.name, this.director,this.directorName,this.dirImgUrl, this.isBlocked, this.rooms});
}
