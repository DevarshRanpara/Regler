import 'package:flutter/material.dart';

import 'package:flutter_app/Views/Profile/profile.dart';

class AdminHomeView extends StatefulWidget {
  @override
  _AdminHomeViewState createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Montserrat',
          accentColor: Colors.teal),
      home: Scaffold(
        body: Center(
          child: RaisedButton(
            child: Text("Profile"),
            onPressed: (){
              Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Profile("Admin")));
            },
          ),
        )
      ),
    );
  }
}
