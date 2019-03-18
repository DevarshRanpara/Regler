import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/Classes/strings.dart';

class RoomTile extends StatefulWidget {
  final Function deleteRoom;
  final Function blockRoom;
  final Room room;

  RoomTile(this.room, this.blockRoom,this.deleteRoom);

  @override
  _RoomTileState createState() => _RoomTileState();
}

class _RoomTileState extends State<RoomTile> {
  @override
  Widget build(BuildContext context) {
    String strblock;
    if (widget.room.isBlocked) {
      strblock = Strings.unblock;
    } else {
      strblock = Strings.block;
    }
    return InkWell(
      onTap: () {},
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(
              width: 15.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: RawMaterialButton(
                onPressed: () {
                  widget.blockRoom(widget.room);
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.block,
                        size: 15.0,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(strblock),
                    ],
                  ),
                ),
                fillColor: Colors.orange,
                splashColor: Colors.orangeAccent,
                shape: const StadiumBorder(),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: RawMaterialButton(
                onPressed: () {
                  widget.deleteRoom(widget.room);
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.delete,
                        size: 15.0,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(Strings.delete),
                    ],
                  ),
                ),
                fillColor: Colors.red,
                splashColor: Colors.redAccent,
                shape: const StadiumBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
