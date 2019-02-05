import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/room.dart';

class RoomUsageTile extends StatefulWidget {
  
  final Room room;

  RoomUsageTile(this.room);

  @override
  _RoomTileState createState() => _RoomTileState();
}

class _RoomTileState extends State<RoomUsageTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Container(
           padding: EdgeInsets.all(20.0),
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
      ),
    );
  }
}
