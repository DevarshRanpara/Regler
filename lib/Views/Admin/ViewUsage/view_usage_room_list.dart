import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Admin/room_usage_tile.dart';
import 'package:flutter_app/CustomWidgets/Common/loading_animation.dart';
import 'package:flutter_app/Models/manage_room_admin_model.dart';

class ViewUsageRoomList extends StatefulWidget {
  final int id;

  final double margine;

  ViewUsageRoomList(this.id, this.margine);
  @override
  _ViewUsageRoomListState createState() => _ViewUsageRoomListState();
}

class _ViewUsageRoomListState extends State<ViewUsageRoomList> {
  List<RoomUsageTile> roomtile = List();
  MngRoomAdminModel model = MngRoomAdminModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(widget.margine),
        child: FutureBuilder(
          future: model.getRoomData(widget.id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return LoadingAnimationCls();
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length + 1,
                itemBuilder: (BuildContext conext, int i) {
                  if (i == 0) {
                    return __getUpperUI();
                  }
                  return RoomUsageTile(snapshot.data[i - 1]);
                },
              );
            }
          },
        ),
      ),
    );
  }

  __getUpperUI() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
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
                      Strings.viewRoomUsage,
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
          children: roomtile,
        )
      ],
    );
  }
}
