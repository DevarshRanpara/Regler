import 'package:flutter/material.dart';

import 'package:flutter_app/CustomWidgets/Common/circular_image.dart';
import './change_password_view.dart';
import './complain_view.dart';

class Profile extends StatefulWidget {
  final String name, role;

  Profile(this.name, this.role);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<Profile> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  void showSnakebar() {
    final snackbar = new SnackBar(
      content: new Text("User Will logout here"),
      backgroundColor: Colors.red,
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  Widget checkRole() {
    if (widget.role == "user") {
      return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Complain()));
        },
        child: Card(
            child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Expanded(
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
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.red[500],
              ),
            ],
          ),
        )),
      );
    } else {
      return SizedBox(
        height: 1.0,
      );
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
        key: scaffoldKey,
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
                          widget.name,
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
                        Expanded(
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
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.red[500],
                        ),
                      ],
                    ),
                  ))),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ChangePassword()));
                },
                child: Card(
                    child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
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
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.red[500],
                      ),
                    ],
                  ),
                )),
              ),
              checkRole(),
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
                  onPressed: () {
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> LoginPage()));
                    showSnakebar();
                  },
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

// class UserProfile1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new
//   }
// }
