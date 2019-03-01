import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/institute.dart';
import 'package:flutter_app/CustomWidgets/Admin/manage_room_institute_tile.dart';

class MngRoomAdmin extends StatefulWidget {
  final Function gotoAddRoom;
  final Institute institutes;
  MngRoomAdmin(this.institutes, this.gotoAddRoom);
  @override
  _MngRoomAdminState createState() => _MngRoomAdminState();
}

class _MngRoomAdminState extends State<MngRoomAdmin> {

  @override
  Widget build(BuildContext context) {
    return MngRoominstitute(widget.institutes, widget.gotoAddRoom);
  }
}
