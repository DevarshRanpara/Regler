import 'package:flutter/material.dart';

import './usage_report_user.dart';
import './upper_dashboard.dart';

class DashboardTop extends StatefulWidget {
  @override
  _DashboardTopState createState() => _DashboardTopState();
}

class _DashboardTopState extends State<DashboardTop> {

  List<Widget> _ListMyWidgets() {
    List<Widget> list = new List();
    list.add(UpperDashboard("Devarsh",1000));
    list.add(UserReport());
    list.add(UserReport());
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: ListView.builder(
      //   itemExtent: 20.0,
      //   itemBuilder: (BuildContext ctx, int index){
      //     UpperDashboard("Devarsh",1000);
      //   },
      //),
      child: Column(
        children: _ListMyWidgets()
      ),
    );
  }
}
