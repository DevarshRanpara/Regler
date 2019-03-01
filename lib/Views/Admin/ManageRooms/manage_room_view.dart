import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Admin/manage_room_institute_tile.dart';
import 'package:flutter_app/CustomWidgets/Admin/manage_room_tile.dart';
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

  MngRoomAdminModel adminModel;
  MngRoomDirModel dirModel;
  var model;

  @override
    void initState() {
      if(Preferances.role==Strings.roleAdmin){
        adminModel = MngRoomAdminModel();
        model=adminModel;
      }
      else{
        dirModel = MngRoomDirModel();
        model=dirModel;
      }
      super.initState();
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
            body: FutureBuilder(
          future: model.getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length + 1,
                itemBuilder: (BuildContext conext, int i) {
                  if (i == 0) {
                    return getUpperUI();
                  }
                  if(Preferances.role==Strings.roleAdmin){
                    return MngRoominstitute(snapshot.data[i - 1],gotoAddRoom);
                  }
                  else{
                    //return MngRoomDir(snapshot.data[i - 1], gotoAddRoom);
                    new RoomTile(snapshot.data[i - 1]);
                  }
                },
              );
            }
          },
        )));
  }

  getUpperUI() {
    Widget addUserBtn;
    if(Preferances.role==Strings.roleAdmin){
      addUserBtn=Container();
    }
    else{
      addUserBtn=Column(
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
    );
    }
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
                addUserBtn
          ],
        ));
  }
}
