import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Common/expantion_tile.dart';
import 'package:flutter_app/Classes/institute.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/CustomWidgets/Admin/manage_room_tile.dart';

class MngRoominstitute extends StatefulWidget {
  final Function blockRoom;
  final Function gotoAddRoom;
  final Institute institute;
  MngRoominstitute(this.institute, this.gotoAddRoom,this.blockRoom);
  @override
  _MngRoominstituteState createState() => _MngRoominstituteState();
}

class _MngRoominstituteState extends State<MngRoominstitute> {
  List<Widget> roomtiles = List();
  List<Room> rooms;

  @override
  void initState() {
    rooms = widget.institute.rooms;

    if (rooms != null) {
      for (int i = 0; i < rooms.length; i++) {
        roomtiles.add(RoomTile(rooms[i],widget.blockRoom));
      }
    } else {
      roomtiles.add(Container());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Card(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                child: AppExpansionTile(
                  title: Row(
                    children: <Widget>[Text(widget.institute.name)],
                  ),
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          widget.gotoAddRoom();
                        },
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(7.0),
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
                ))));
  }
}
