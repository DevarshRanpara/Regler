import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/institute.dart';
import 'package:flutter_app/CustomWidgets/Admin/manage_room_institute_tile.dart';

class MngRoomAdmin extends StatefulWidget {
  final Function gotoAddRoom;
  final List<Institute> institutes;
  MngRoomAdmin(this.institutes, this.gotoAddRoom);
  @override
  _MngRoomAdminState createState() => _MngRoomAdminState();
}

class _MngRoomAdminState extends State<MngRoomAdmin> {
  List<MngRoominstitute> building = List();

  @override
  void initState() {
    for (int i = 0; i < widget.institutes.length; i++) {
      building.add(MngRoominstitute(widget.institutes[i], widget.gotoAddRoom));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: building);
  }
}
