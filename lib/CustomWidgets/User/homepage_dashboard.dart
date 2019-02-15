import 'package:flutter/material.dart';

import 'package:flutter_app/CustomWidgets/Common/usage_report_user.dart';
import './upper_dashboard.dart';
import 'package:flutter_app/Classes/user_usage.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Classes/admin_navigation.dart';

class DashboardTop extends StatefulWidget {
  final UserData data;
  final Nevigation nevigation;
  DashboardTop(this.data, this.nevigation);

  @override
  _DashboardTopState createState() => _DashboardTopState();
}

class _DashboardTopState extends State<DashboardTop> {
  List<Widget> list = new List();
  bool flag = true;

  @override
  void initState() {
    for (var i = 0; i < widget.data.useData.length; i++) {
      _addItem(widget.data.useData[i]);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[UpperDashboard(widget.data, widget.nevigation)],
          ),
          Column(
            children: list,
          )
        ],
      ),
    );
  }
}
