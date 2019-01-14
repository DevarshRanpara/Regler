import 'package:flutter/material.dart';

import '../CustomWidgets/homepage_dashboard.dart';
import '../Views/user_profile.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePageView();
  }
}

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  void _gotoProfile(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> UserProfile()));
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark, 
        fontFamily: 'Montserrat',
        accentColor: Colors.teal
        ),
      home: Scaffold(
        
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
              ),
              DashboardTop(_gotoProfile)
            ],
          ),
        ),
      ),
    );
  }
}
