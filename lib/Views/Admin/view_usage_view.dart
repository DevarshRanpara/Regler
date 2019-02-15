import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Models/view_usage_building_model.dart';
import 'package:flutter_app/Views/Admin/admin_use_view.dart';
import 'package:flutter_app/Views/Admin/view_usage_building.dart';
import 'package:flutter_app/Views/Admin/view_usage_room.dart';

import 'package:flutter_app/Views/Admin/view_usage_user.dart';

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
    if (widget.role == 'admin') {
      inst = 'Building';
      Widget usageBuilding = ViewUsageBulding(gotoRoom);
      pages = [usageUser, usageBuilding];
    } else {
      inst = 'Room';
      ViewUsageBuldingModel model = ViewUsageBuldingModel();
      Widget usageRoom = ViewUsageRoom(model.buildings[0].rooms, 0);
      pages = [usageUser, usageRoom];
    }

    super.initState();
  }

  void gotoUsage(UserData use) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => AdminUseView(use.useData)));
  }

  void gotoRoom(List<Room> rooms) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ViewUsageRoom(rooms, 8)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Montserrat',
            accentColor: Colors.teal),
        home: Scaffold(
          body: Container(
            margin: EdgeInsets.all(8.0),
            child: pages.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.supervisor_account),
                  title: Text("User Wise")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_city), title: Text(inst + " Wise"))
            ],
            currentIndex: _selectedIndex,
            fixedColor: Colors.tealAccent,
            onTap: _onItemTapped,
          ),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
