import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Models/view_usage_institute_model.dart';
import 'package:flutter_app/Views/Admin/admin_use_view.dart';
import 'package:flutter_app/Views/Admin/ViewUsage/view_usage_institute.dart';
import 'package:flutter_app/Views/Admin/ViewUsage/view_usage_room.dart';
import 'package:flutter_app/Views/Admin/ViewUsage/view_usage_user.dart';

class ViewUsageView extends StatefulWidget {
  final String role;

  ViewUsageView(this.role);

  @override
  _ViewUsageViewState createState() => _ViewUsageViewState();
}

class _ViewUsageViewState extends State<ViewUsageView> {
  List<Widget> pages;
  int _selectedIndex = 0;
  String inst;

  @override
  void initState() {
    Widget usageUser = ViewUsageUser(gotoUsage);
    if (widget.role == Strings.roleAdmin) {
      inst = Strings.lblInstitute;
      Widget usageInstitute = ViewUsageInstitute(gotoRoom);
      pages = [usageUser, usageInstitute];
    } else {
      inst = Strings.room;
      ViewUsageInstituteModel model = ViewUsageInstituteModel();
      Widget usageRoom = ViewUsageRoom(model.institutes[0].rooms, 0);
      pages = [usageUser, usageRoom];
    }

    super.initState();
  }

  void gotoUsage(UserData use) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => AdminUseView(use.id.toString())));
  }

  void gotoRoom(List<Room> rooms) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ViewUsageRoom(rooms, 8)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            margin: EdgeInsets.all(8.0),
            child: pages.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.supervisor_account),
                  title: Text(Strings.userWise)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_city),
                  title: Text(inst + Strings.wise))
            ],
            currentIndex: _selectedIndex,
            fixedColor: Colors.tealAccent,
            onTap: _onItemTapped,
          ),
        );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
