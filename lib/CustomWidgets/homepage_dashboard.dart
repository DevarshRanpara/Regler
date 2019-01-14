import 'package:flutter/material.dart';

import './usage_report_user.dart';
import './upper_dashboard.dart';

class DashboardTop extends StatefulWidget {
  @override
  _DashboardTopState createState() => _DashboardTopState();
}

class _DashboardTopState extends State<DashboardTop> {

  String uname="Devarsh";
  int limit=1000;
  List<Widget> list = new List();

  void _AddItem()
  {
    setState(() {
          list.add(UserReport());
        });
  }

  List<Widget> _ListMyWidgets() {
    
    //list.add(UpperDashboard(uname,limit,AddItem));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: Column(
        children: <Widget>[
          Column(children: <Widget>[
            UpperDashboard(uname,limit,_AddItem)
          ],),
          Column(children: _ListMyWidgets(),)
        ],
      ),
    );
  }
}
