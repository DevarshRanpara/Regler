import 'package:flutter/material.dart';

class ManageRoomView extends StatefulWidget {
  final String role;

  ManageRoomView(this.role);

  @override
  _ManageRoomViewState createState() => _ManageRoomViewState();
}

class _ManageRoomViewState extends State<ManageRoomView> {

  @override
  Widget build(BuildContext context) {

    Widget manageRoom;

    if(widget.role=='admin')
    {
      manageRoom=Text("ManageRoomView " + widget.role);
    }
    else
    {
      manageRoom=Text("ManageRoomView " + widget.role);
    }

    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Montserrat',
            accentColor: Colors.teal),
        home: Scaffold(
          body: Center(
            child: manageRoom,
          ),
        ));
  }
}
