import 'package:flutter/material.dart';

import 'package:flutter_app/Views/Admin/view_usage_user.dart';

class ViewUsageView extends StatefulWidget {
  @override
  _ViewUsageViewState createState() => _ViewUsageViewState();
}

class _ViewUsageViewState extends State<ViewUsageView> {
  int _selectedIndex = 0;
  final _widgetOption = [
    ViewUsageUser(),
    Text("Building")
    ];
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
            child:_widgetOption.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.supervisor_account),
                  title: Text("User Wise")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_city), title: Text("Building Wise"))
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
