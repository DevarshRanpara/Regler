import 'package:flutter_app/Classes/building.dart';
import 'package:flutter_app/Classes/room.dart';

class ViewUsageBuldingModel
{
  List<Building> buildings;
  List<Room> rooms;

  ViewUsageBuldingModel(){
    rooms=[
      Room(name: '101'),
      Room(name: '102'),
      Room(name: '103'),
      Room(name: '104'),
      Room(name: '105')
    ];

    buildings=[
      Building(name: "LJ MCA",rooms: rooms),
      Building(name: "LJ MCA",rooms: rooms),
      Building(name: "LJ Engg.",rooms: rooms),
      Building(name: "LJ Law",rooms: rooms)
    ];
  }

  List<Building> getData(){
    return buildings;
  }

}