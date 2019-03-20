import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Common/expantion_tile.dart';
import 'package:flutter_app/CustomWidgets/Common/loading_animation.dart';
import 'package:flutter_app/Models/mng_room_dir_model.dart';

class Complain extends StatefulWidget {
  @override
  _ComplainState createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {
  String expantitle = Strings.selectRoom;
  final GlobalKey<AppExpansionTileState> expansionTile = new GlobalKey();
  MngRoomDirModel model = MngRoomDirModel();
  List<Widget> listTles = List<Widget>();
  Widget mainUI;

  @override
  void initState() {
    _setView();
    super.initState();
  }

  _setView() async {
    mainUI = LoadingAnimationCls();
    List<Room> rooms = List<Room>();
    rooms = await model.getData();
    for (int i = 0; i < rooms.length; i++) {
      listTles.add(ListTile(
        title: Text(rooms[i].name),
        onTap: () {
          setState(() {
            this.expantitle = rooms[i].name;
            print(rooms[i].name);
            expansionTile.currentState.collapse();
          });
        },
      ));
    }
    setState(() {
      mainUI = _getUpperUI();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(margin: EdgeInsets.all(8.0), child: mainUI),
    );
  }

  _getUpperUI() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: InkWell(
              onTap: () {},
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.error,
                      color: Colors.redAccent,
                      size: 35.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      Strings.complain,
                      style: TextStyle(
                          color: Colors.tealAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              ))),
        ),
        InkWell(
            onTap: () {},
            child: Card(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 2.0),
                    child: AppExpansionTile(
                        key: expansionTile,
                        title: Text(expantitle),
                        children: listTles)))),
        InkWell(
            onTap: () {},
            child: Card(
                child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: Strings.enterDetails),
                  )
                ],
              ),
            ))),
        Center(
          child: RaisedButton(
            color: Colors.teal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.check),
                SizedBox(
                  width: 8,
                ),
                Text(
                  Strings.btnSubmit,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            onPressed: () {},
            splashColor: Colors.tealAccent,
          ),
        ),
      ],
    );
  }
}
