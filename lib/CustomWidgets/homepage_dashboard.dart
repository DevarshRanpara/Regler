import 'package:flutter/material.dart';

import './usage_report_user.dart';
import './upper_dashboard.dart';
import '../Classes/user_usage.dart';

class DashboardTop extends StatefulWidget {
  final Function _gotoProfile, _gotoUsage;

  DashboardTop(this._gotoProfile, this._gotoUsage);

  @override
  _DashboardTopState createState() => _DashboardTopState();
}

class _DashboardTopState extends State<DashboardTop> {
  String uname = "Devarsh";
  int limit = 200;
  List<Widget> list = new List();
  bool flag = true;
  int usage = 0;

  var data = [
    UserUsage("10th, Jan, 2019", "10:00 AM", "10:20 AM", 20),
    UserUsage("12th, Jan, 2019", "10:00 AM", "10:20 AM", 20),
    UserUsage("13th, Jan, 2019", "10:00 AM", "10:30 AM", 30),
    UserUsage("16th, Jan, 2019", "10:00 AM", "10:50 AM", 50),
  ];

  @override
  void initState() {
    for (var i = 0; i < data.length; i++) {
      _addItem(data[i]);
      usage += data[i].use;
    }
    super.initState();
  }

  void _addItem(UserUsage data) {
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
      list.add(UserReport(data));
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
              UpperDashboard(uname, limit - usage, _addItem,
                  widget._gotoProfile, widget._gotoUsage, usage)
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
