import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Admin/manage_room_tile.dart';
import 'package:flutter_app/CustomWidgets/Common/loading_animation.dart';
import 'package:flutter_app/Models/mng_room_dir_model.dart';
import 'package:flutter_app/Views/Admin/ManageRooms/add_room_view.dart';

class ManageRoomDir extends StatefulWidget {
  @override
  _ManageRoomDirState createState() => _ManageRoomDirState();
}

class _ManageRoomDirState extends State<ManageRoomDir> {
  MngRoomDirModel model;

  @override
  void initState() {
    model = MngRoomDirModel();
    super.initState();
  }

  void gotoAddRoom() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => AddRoomView()));
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
                    return getUpperUI();
                  }
                  RoomTile(snapshot.data[i - 1]);
                },
              );
            }
          },
        ));
  }

  getUpperUI() {
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
            Column(
              children: <Widget>[
                InkWell(
                    onTap: () {
                      gotoAddRoom();
                    },
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
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
              ],
            )
          ],
        ));
  }
}
