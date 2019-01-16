import 'package:flutter/material.dart';

import './usage_report_user.dart';
import './upper_dashboard.dart';

class DashboardTop extends StatefulWidget {
  final Function _gotoProfile;

  DashboardTop(this._gotoProfile);

  @override
  _DashboardTopState createState() => _DashboardTopState();
}

class _DashboardTopState extends State<DashboardTop> {
  String uname = "Devarsh";
  int limit = 1000;
  List<Widget> list = new List();

  void _addItem() {
    setState(() {
      list.add(UserReport());
    });
  }

  List<Widget> _listMyWidgets() {
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              UpperDashboard(uname, limit, _addItem, widget._gotoProfile)
            ],
          ),
          Column(
            children: _listMyWidgets(),
          )
        ],
      ),
    );
  }
}
