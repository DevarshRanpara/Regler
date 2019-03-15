import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/room.dart';

class RoomUsageTile extends StatefulWidget {

  final Function gotoRoomUsage;

  final Room room;

  RoomUsageTile(this.room,this.gotoRoomUsage);

  @override
  _RoomTileState createState() => _RoomTileState();
}

class _RoomTileState extends State<RoomUsageTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {widget.gotoRoomUsage();},
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.crop_square,
                      color: Colors.redAccent,
                      size: 25.0,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      widget.room.name,
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.red[500],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
