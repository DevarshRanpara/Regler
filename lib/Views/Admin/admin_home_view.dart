import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Views/Admin/ManageRooms/manage_room_dir.dart';
import 'package:flutter_app/Views/Profile/profile.dart';
import 'package:flutter_app/Views/Admin/admin_use_view.dart';
import 'package:flutter_app/Views/Admin/ManageUsers/manage_users_view.dart';
import 'package:flutter_app/Views/Admin/ManageInstitute/manage_institute_view.dart';
import 'package:flutter_app/Views/Admin/ManageRooms/manage_room_admin.dart';
import 'package:flutter_app/Views/Admin/view_complain_view.dart';
import 'package:flutter_app/Views/Admin/ViewUsage/view_usage_view.dart';
import 'package:flutter_app/Models/admin_home_model.dart';
import 'package:flutter_app/CustomWidgets/Admin/common_home_view.dart';
import 'package:flutter_app/Classes/admin_navigation.dart';
import 'package:flutter_app/Classes/preferances.dart';

class AdminHomeView extends StatefulWidget {
  @override
  _AdminHomeViewState createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {
  AdminHomeModel model;
  Nevigation nevigation;
  UserData data;

  @override
  void initState() {
    if (Preferances.role == Strings.roleAdmin) {
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
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ManageUsersView()));
  }

  void _gotoManageBuildings() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ManageBuildingView()));
  }

  void _gotoManageRooms() {
    if (Preferances.role == Strings.roleAdmin) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ManageRoomView()));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ManageRoomDir()));
    }
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

    return Scaffold(body: CommonHomeView(nevigation, data));
  }
}
