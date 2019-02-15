import 'package:flutter/material.dart';
import 'package:flutter_app/CustomWidgets/User/homepage_dashboard.dart';
import 'package:flutter_app/Views/Profile/profile.dart';
import './usage_detail_view.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Models/user_home_model.dart';
import 'package:flutter_app/Classes/admin_navigation.dart';

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
  UserData data;
  UserHomeModel model;
  Nevigation nevigation;

  @override
  void initState() {
    setData();
    super.initState();
  }

  void setData() {
    model = UserHomeModel(_gotoProfile, _gotoUsage);
    nevigation = model.getNevigation();
    data = model.getData();
  }

  void _gotoProfile() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Profile(data.name, data.role)));
  }

  void _gotoUsage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                UsageDetail(data.used, data.limit)));
  }

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
              DashboardTop(data, nevigation)
            ],
          ),
        ),
      ),
    );
  }
}
