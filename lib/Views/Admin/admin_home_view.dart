import 'package:flutter/material.dart';

import 'package:flutter_app/Views/Profile/profile.dart';
import 'package:flutter_app/Models/admin_home_model.dart';
import 'package:flutter_app/CustomWidgets/common_home_view.dart';
import 'package:flutter_app/Classes/admin_navigation.dart';

class AdminHomeView extends StatefulWidget {

  final String role;

  AdminHomeView(this.role);

  @override
  _AdminHomeViewState createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {

  AdminHomeModel model;
  AdminNevigation nevigation;

  @override
    void initState() {
      if(widget.role=="admin"){
        model=AdminHomeModel("Admin","admin");
      }
      else{
        model=AdminHomeModel("Director","director");
      }
      super.initState();
    }

  void _gotoProfile()
  {
    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => Profile(model.data.name,model.data.role)));
  }

  void _gotoUsage()
  {

  }

  void _gotoManageUsers()
  {

  }

  void _gotoManageBuildings()
  {

  }

  void _gotoManageRooms()
  {

  }

  void _gotoViewUsage()
  {

  }

  void _gotoViewComplains()
  {

  }

  @override
  Widget build(BuildContext context) {

    nevigation=AdminNevigation(
      gotoProfile: _gotoProfile,
      gotoUsage: _gotoUsage,
      gotoManageUsers: _gotoManageUsers,
      gotoManageBuildings: _gotoManageBuildings,
      gotoManageRooms: _gotoManageRooms,
      gotoViewUsage: _gotoViewUsage,
      gotoViewComplains: _gotoViewComplains
    );

    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Montserrat',
          accentColor: Colors.teal),
      home: Scaffold(
        body:CommonHomeView(nevigation,model.data.name,model.data.role)
        
      ),
    );
  }
}
