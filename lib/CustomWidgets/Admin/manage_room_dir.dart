import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Admin/manage_room_tile.dart';

class MngRoomDir extends StatefulWidget {
  final Function gotoAddRoom;
  final List<Room> rooms;

  MngRoomDir(this.rooms, this.gotoAddRoom);

  @override
  _MngRoomDirState createState() => _MngRoomDirState();
}

class _MngRoomDirState extends State<MngRoomDir> {
  List<RoomTile> roomtiles = List();

  @override
  void initState() {
    for (int i = 0; i < widget.rooms.length; i++) {
      roomtiles.add(RoomTile(widget.rooms[i]));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
            onTap: () {
              widget.gotoAddRoom();
            },
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      Strings.addRoom,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            )),
        Column(
          children: roomtiles,
        )
      ],
    );
  }
}
