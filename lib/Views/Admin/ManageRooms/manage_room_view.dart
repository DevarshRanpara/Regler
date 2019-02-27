import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Admin/manage_room_admin.dart';
import 'package:flutter_app/CustomWidgets/Admin/manage_room_dir.dart';
import 'package:flutter_app/Models/mng_room_dir_model.dart';
import 'package:flutter_app/Models/manage_room_admin_model.dart';
import 'package:flutter_app/Views/Admin/ManageRooms/add_room_view.dart';

class ManageRoomView extends StatefulWidget {
  final String role;

  ManageRoomView(this.role);

  @override
  _ManageRoomViewState createState() => _ManageRoomViewState();
}

class _ManageRoomViewState extends State<ManageRoomView> {
  Widget checkRole(Function gotoAddRoom) {
    if (widget.role == Strings.roleAdmin) {
      MngRoomAdminModel model = MngRoomAdminModel();
      return MngRoomAdmin(model.getData(), gotoAddRoom);
    } else {
      MngRoomDirModel model = MngRoomDirModel();
      return MngRoomDir(model.getData(), gotoAddRoom);
    }
  }

  void gotoAddRoom() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => AddRoomView()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: Strings.fontFamily,
            accentColor: Colors.teal),
        home: Scaffold(
          body: Container(
              child: ListView(
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
                  ))),
              checkRole(gotoAddRoom)
            ],
          )),
        ));
  }
}
