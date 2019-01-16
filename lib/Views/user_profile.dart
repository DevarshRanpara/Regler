import 'package:flutter/material.dart';

import '../CustomWidgets/circular_image.dart';
import './change_password_view.dart';
import './complain_view.dart';
import './login_view.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
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
                        CircularImage(
                          AssetImage("assets/dev.jpeg"),
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Devarsh",
                          style: TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ))),
              InkWell(
                  onTap: () {},
                  child: Card(
                      child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: Colors.redAccent,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text("Change Profile Picture")
                      ],
                    ),
                  ))),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ChangePassword()));
                },
                child: Card(
                    child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.security,
                        color: Colors.redAccent,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text("Change Password")
                    ],
                  ),
                )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Complain()));
                },
                child: Card(
                    child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.error,
                        color: Colors.redAccent,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text("Complain")
                    ],
                  ),
                )),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.red,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.arrow_back),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  onPressed: () {},
                  splashColor: Colors.orangeAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
