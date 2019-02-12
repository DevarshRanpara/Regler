import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/CustomWidgets/Common/dialog.dart';
import 'package:flutter_app/Models/manage_users_model.dart';

import 'package:flutter_app/Views/Profile/profile.dart';
import 'package:flutter_app/Views/Admin/admin_use_view.dart';
import 'package:flutter_app/Views/Admin/manage_users_view.dart';
import 'package:flutter_app/Views/Admin/manage_building_view.dart';
import 'package:flutter_app/Views/Admin/manage_room_view.dart';
import 'package:flutter_app/Views/Admin/view_complain_view.dart';
import 'package:flutter_app/Views/Admin/view_usage_view.dart';

import 'package:flutter_app/Models/admin_home_model.dart';

import 'package:flutter_app/CustomWidgets/Admin/common_home_view.dart';

import 'package:flutter_app/Classes/admin_navigation.dart';

import 'package:flutter_app/Classes/preferances.dart';

class AdminHomeView extends StatefulWidget {
  final String role;

  AdminHomeView(this.role);

  @override
  _AdminHomeViewState createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {
  AdminHomeModel model;
  Nevigation nevigation;
  UserData data;

  @override
  void initState() {
    if (widget.role == "admin") {
      model = AdminHomeModel(Preferances.name, Preferances.role);
    } else {
      model = AdminHomeModel(Preferances.name, Preferances.role);
    }
    setData();
    super.initState();
  }

  void setData() {
    data = model.data;
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
            builder: (BuildContext context) => AdminUseView(model.use)));
  }

  void _gotoManageUsers() async {
    ManageUsersModel model = ManageUsersModel();
    Dialogs dialogs = Dialogs(context);
    dialogs.setMessage('Loading');
    dialogs.show();
    await model.setData();
    dialogs.hide();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ManageUsersView(model)));
  }

  void _gotoManageBuildings() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ManageBuildingView()));
  }

  void _gotoManageRooms() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ManageRoomView(model.role)));
  }

  void _gotoViewUsage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ViewUsageView(data.role)));
  }

  void _gotoViewComplains() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ViewComplainView()));
  }

  @override
  Widget build(BuildContext context) {
    nevigation = Nevigation(
        gotoProfile: _gotoProfile,
        gotoUsage: _gotoUsage,
        gotoManageUsers: _gotoManageUsers,
        gotoManageBuildings: _gotoManageBuildings,
        gotoManageRooms: _gotoManageRooms,
        gotoViewUsage: _gotoViewUsage,
        gotoViewComplains: _gotoViewComplains);

    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Montserrat',
          accentColor: Colors.teal),
      home: Scaffold(body: CommonHomeView(nevigation, data)),
    );
  }
}
