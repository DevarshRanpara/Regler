import 'package:flutter/material.dart';

import 'package:flutter_app/CustomWidgets/homepage_dashboard.dart';
import 'package:flutter_app/Views/Profile/profile.dart';
import './usage_detail_view.dart';

class UserMainPage extends StatelessWidget {
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
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  void showSnakebar() {
    final snackbar = new SnackBar(
      content: new Text("No Internet Avilable"),
      backgroundColor: Colors.red,
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  void _gotoProfile() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => Profile()));
  }

  void _gotoUsage(int usage,int limit) {
    //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> DonutAutoLabelChart()));
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => UsageDetail(usage,limit)));
    //showSnakebar();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
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
              DashboardTop(_gotoProfile, _gotoUsage)
            ],
          ),
        ),
      ),
    );
  }
}
