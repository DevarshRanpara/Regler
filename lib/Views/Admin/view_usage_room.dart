import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/CustomWidgets/Admin/room_usage_tile.dart';

class ViewUsageRoom extends StatefulWidget {

  final List<Room> rooms;

  ViewUsageRoom(this.rooms);
  @override
  _ViewUsageRoomState createState() => _ViewUsageRoomState();
}

class _ViewUsageRoomState extends State<ViewUsageRoom> {

  List<RoomUsageTile> roomtile=List();

  @override
    void initState() {
      for(int i=0;i<widget.rooms.length;i++){
        roomtile.add(RoomUsageTile(widget.rooms[i]));
      }
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Montserrat',
            accentColor: Colors.teal),
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: ListView(
      children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
          ),
          InkWell(
              onTap: () {},
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.crop_square,
                      color: Colors.redAccent,
                      size: 35.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "View Room Usage",
                      style: TextStyle(
                          color: Colors.tealAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              ))),
              Column(children: roomtile,)
      ],
    ),
        ),
      ),
    );
  }
}