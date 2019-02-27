import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';

class AddRoomView extends StatefulWidget {
  @override
  _AddRoomViewState createState() => _AddRoomViewState();
}

class _AddRoomViewState extends State<AddRoomView> {
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 2.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          onChanged: (String val) {},
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: Strings.enterRoomNo),
                        )
                      ],
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
                  onPressed: () {},
                ),
              ),
            ],
          )),
        ));
  }
}
