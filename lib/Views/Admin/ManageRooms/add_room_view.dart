import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/Models/mng_room_dir_model.dart';

class AddRoomView extends StatefulWidget {
  final String insid;

  AddRoomView(this.insid);
  @override
  _AddRoomViewState createState() => _AddRoomViewState();
}

class _AddRoomViewState extends State<AddRoomView> {
  MngRoomDirModel model = MngRoomDirModel();

  final formKey = GlobalKey<FormState>();

  String roomNo;

  _validate() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      model.addRoom(roomNo, widget.insid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Strings.addRoom,
                      style: TextStyle(
                          color: Colors.tealAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              ))),
          InkWell(
              onTap: () {},
              child: Card(
                  child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: Strings.enterRoomNo),
                        validator: (val) =>
                            val.length > 5 ? Strings.errorRoomNo : null,
                            onSaved: (val) => roomNo = val,
                      )
                    ],
                  ),
                ),
              ))),
          Center(
            child: RaisedButton(
              color: Colors.blue,
              splashColor: Colors.blueAccent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.add),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    Strings.addRoom,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              onPressed: () {
                _validate();
              },
            ),
          ),
        ],
      )),
    );
  }
}
