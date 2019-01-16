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
  bool flag = true;

  @override
    void initState() {
        _addItem();
        _addItem();
        _addItem();
      super.initState();
    }


  void _addItem() {
    if (flag) {
      list.add(
        Container(
          margin: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            "Your Usage",
            style: TextStyle(
                color: Colors.red, fontSize: 25.0, fontWeight: FontWeight.bold),
          )),
        ),
      );
      flag = false;
    }
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
