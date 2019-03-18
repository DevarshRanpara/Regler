import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/Models/mng_room_dir_model.dart';

class DialogsRooms {
  BuildContext buildContext;

  DialogsRooms(this.buildContext);

  showAlertRoomBlock(Room room) {
    MngRoomDirModel model = MngRoomDirModel();

    String title;
    if (room.isBlocked) {
      title = Strings.unblockRoom;
    } else {
      title = Strings.blockRoom;
    }
    showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.crop_square, color: Colors.red),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(room.name)
                  ],
                )
              ],
            ),
            actions: <Widget>[
              RawMaterialButton(
                child: Text(
                  Strings.yes,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                  model.blockRoom(room.id.toString());
                },
              ),
              RawMaterialButton(
                child: Text(
                  Strings.no,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                },
              )
            ],
          );
        });
  }

  showAlertRoomDelete(Room room) {
    MngRoomDirModel model = MngRoomDirModel();

    showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(Strings.deleteroom),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.crop_square, color: Colors.red),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(room.name)
                  ],
                )
              ],
            ),
            actions: <Widget>[
              RawMaterialButton(
                child: Text(
                  Strings.yes,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                  model.deleteRoom(room.id.toString());
                },
              ),
              RawMaterialButton(
                child: Text(
                  Strings.no,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                },
              )
            ],
          );
        });
  }
}
