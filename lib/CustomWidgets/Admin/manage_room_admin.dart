import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/building.dart';
import 'package:flutter_app/CustomWidgets/Admin/manage_room_building_tile.dart';

class MngRoomAdmin extends StatefulWidget {
  final Function gotoAddRoom;
  final List<Building> buildings;
  MngRoomAdmin(this.buildings, this.gotoAddRoom);
  @override
  _MngRoomAdminState createState() => _MngRoomAdminState();
}

class _MngRoomAdminState extends State<MngRoomAdmin> {
  List<MngRoomBuilding> building = List();

  @override
  void initState() {
    for (int i = 0; i < widget.buildings.length; i++) {
      building.add(MngRoomBuilding(widget.buildings[i], widget.gotoAddRoom));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: building);
  }
}
