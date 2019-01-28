import 'package:flutter/material.dart';

import 'package:flutter_app/CustomWidgets/Admin/manage_room_admin.dart';
import 'package:flutter_app/CustomWidgets/Admin/manage_room_dir.dart';
import 'package:flutter_app/Models/mng_room_dir_model.dart';
import 'package:flutter_app/Models/manage_room_admin_model.dart';

class ManageRoomView extends StatefulWidget {
  final String role;

  ManageRoomView(this.role);

  @override
  _ManageRoomViewState createState() => _ManageRoomViewState();
}

class _ManageRoomViewState extends State<ManageRoomView> {
  Widget checkRole() {
    if (widget.role == 'admin') {
      MngRoomAdminModel model = MngRoomAdminModel();
      return MngRoomAdmin(model.getData());
    } else {
      MngRoomDirModel model = MngRoomDirModel();
      return MngRoomDir(model.getData());
    }
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 2.0),
                  ),
                  checkRole()
                ],
              )),
        ));
  }
}
