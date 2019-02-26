import 'package:flutter_app/Classes/institute.dart';
import 'package:flutter_app/Classes/room.dart';

class ViewUsageInstituteModel {
  List<Institute> buildings;
  List<Room> rooms;

  ViewUsageInstituteModel() {
    rooms = [
      Room(name: '101'),
      Room(name: '102'),
      Room(name: '103'),
      Room(name: '104'),
      Room(name: '105')
    ];

    buildings = [
      Institute(name: "LJ MCA", rooms: rooms),
      Institute(name: "LJ MCA", rooms: rooms),
      Institute(name: "LJ Engg.", rooms: rooms),
      Institute(name: "LJ Law", rooms: rooms)
    ];
  }

  List<Institute> getData() {
    return buildings;
  }
}
