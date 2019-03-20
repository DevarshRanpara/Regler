import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Common/circular_image.dart';
import 'package:flutter_app/CustomWidgets/Common/get_image.dart';
import 'package:flutter_app/Views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './change_password_view.dart';
import './complain_view.dart';

class Profile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<Profile> {
  File _image;
  GetImage getImage;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  SharedPreferences prefs;

  @override
    void initState() {
      getImage=GetImage(context);
      super.initState();
    }

  void showSnakebar() {
    final snackbar = new SnackBar(
      content: new Text(Strings.logoutMsg),
      backgroundColor: Colors.red,
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  _initPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Widget checkRole() {
    if (Preferances.role == Strings.roleUser) {
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
                    Text(Strings.complain)
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

  _logout() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(Strings.lbllogoutMsg),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[],
                ),
              ],
            ),
            actions: <Widget>[
              RawMaterialButton(
                child: Text(
                  Strings.yes,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  prefs.setBool(Strings.keyIsLoggedin, false);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()),
                    ModalRoute.withName('/'),
                  );
                },
              ),
              RawMaterialButton(
                child: Text(
                  Strings.no,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _initPref();
    return Scaffold(
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
                      Hero(
                        tag: Strings.heroProfile,
                        child: CircularImage(
                          NetworkImage(Preferances.imgurl),
                          width: 100,
                          height: 100,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        Preferances.name,
                        style: TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ))),
            InkWell(
                onTap: () {
                  getImage.showDialouge();
                  _image=getImage.getFile();
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
                              Icons.person,
                              color: Colors.redAccent,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text(Strings.changeProfilePic)
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
                          Hero(
                            tag: Strings.heroChpass,
                            child: Icon(
                              Icons.security,
                              color: Colors.redAccent,
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(Strings.chPass)
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
                      Strings.logout,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                onPressed: () {
                  _logout();
                },
                splashColor: Colors.orangeAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
