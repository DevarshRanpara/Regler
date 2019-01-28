import 'package:flutter_app/Classes/building.dart';

class ManageBuildingModel {
  List<Building> buildings;

  ManageBuildingModel() {
    buildings = [
      Building(name: "LJ MCA", director: "Devarsh"),
      Building(name: "LJ MBA", director: "Nilesh"),
      Building(name: "LJ Engg.", director: "Dhaval"),
      Building(name: "LJ Articture", director: "Ravi"),
      Building(name: "LJ MCA", director: "Nilesh")
    ];
  }
  List<Building> getData() {
    return buildings;
  }
}
