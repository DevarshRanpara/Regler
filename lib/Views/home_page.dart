import 'package:flutter/material.dart';

import '../CustomWidgets/homepage_dashboard.dart';
import '../Views/user_profile.dart';
import './usage_detail_view.dart';

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

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  void showSnakebar() {
    final snackbar = new SnackBar(
      content: new Text("No Internet Avilable"),
      backgroundColor: Colors.red,
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  void _gotoProfile(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> UserProfile()));
  }

  void _gotoUsage(int usage){
    //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> DonutAutoLabelChart()));
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> UsageDetail(usage)));
    //showSnakebar();
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
        key: scaffoldKey,
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
              ),
              DashboardTop(_gotoProfile,_gotoUsage)
            ],
          ),
        ),
      ),
    );
  }
}
