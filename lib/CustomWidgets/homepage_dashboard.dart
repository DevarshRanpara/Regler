import 'package:flutter/material.dart';

import './usage_report_user.dart';
import '../CustomWidgets/circular_image.dart';

class DashboardTop extends StatefulWidget {
  @override
  _DashboardTopState createState() => _DashboardTopState();
}



class _DashboardTopState extends State<DashboardTop> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
          ),
          InkWell(
            onTap: (){},
            child: Card(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 30.0),
                  ),
                  Row(
                    children: <Widget>[
                      CircularImage(
                        AssetImage("assets/dev.jpeg"),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Welcome Mr. Devarsh",
                        style:
                            TextStyle(color: Colors.tealAccent, fontSize: 15.0),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Center(
            child: OutlineButton(
              child: Text("Turn On AC"),
              onPressed: () {},
              shape: const StadiumBorder(),
            ),
          ),
          Card(
              child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 50.0),
              ),
              Column(
                children: <Widget>[
                  //Padding(padding: const EdgeInsets.all(8.0),),
                  Text("Remaining Balance "),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "1000 Minutes",
                    style: TextStyle(color: Colors.redAccent, fontSize: 20.0),
                  )
                ],
              )
            ],
          )),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              "Your Usage",
              style: TextStyle(color: Colors.red, fontSize: 20.0),
            )),
          ),
          UserReport(),
          UserReport(),
          UserReport(),
          UserReport(),
          UserReport(),
          UserReport(),
          UserReport(),
          UserReport()
        ],
      ),
    );
  }
}
