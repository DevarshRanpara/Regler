import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Admin/dialouges_rooms.dart';
import 'package:flutter_app/CustomWidgets/Admin/manage_room_institute_tile.dart';
import 'package:flutter_app/CustomWidgets/Common/loading_animation.dart';
import 'package:flutter_app/Models/manage_room_admin_model.dart';
import 'package:flutter_app/Views/Admin/ManageRooms/add_room_view.dart';

class ManageRoomView extends StatefulWidget {
  @override
  _ManageRoomViewState createState() => _ManageRoomViewState();
}

class _ManageRoomViewState extends State<ManageRoomView> {
  MngRoomAdminModel model;

  DialogsRooms dialog;

  @override
  void initState() {
    dialog = DialogsRooms(context);
    model = MngRoomAdminModel();
    super.initState();
  }

  void gotoAddRoom(String insid) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => AddRoomView(insid)));
  }

  void blockRoom(Room room) {
    dialog.showAlertRoomBlock(room);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: model.getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return LoadingAnimationCls();
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length + 1,
            itemBuilder: (BuildContext conext, int i) {
              if (i == 0) {
                return _getUpperUI();
              }
              return MngRoominstitute(snapshot.data[i - 1], gotoAddRoom,blockRoom);
            },
          );
        }
      },
    ));
  }

  _getUpperUI() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            ),
            InkWell(
                onTap: () {},
                child: Card(
                    child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
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
                          Strings.manageRooms,
                          style: TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  ),
                ))),
          ],
        ));
  }
}
