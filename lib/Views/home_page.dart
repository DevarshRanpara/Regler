import 'package:flutter/material.dart';

import '../CustomWidgets/homepage_dashboard.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HomePageView();
  }
}

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[DashboardTop()
            ],
          ),
        ),
      ),
    );
  }
}
