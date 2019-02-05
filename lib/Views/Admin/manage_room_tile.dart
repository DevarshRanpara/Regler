import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/room.dart';

class RoomTile extends StatefulWidget {
  final Room room;

  RoomTile(this.room);

  @override
  _RoomTileState createState() => _RoomTileState();
}

class _RoomTileState extends State<RoomTile> {
  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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
                      Text("Block"),
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
                onPressed: () {},
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
                      Text("Delete"),
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
