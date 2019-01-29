import 'package:flutter/material.dart';

class ViewUsageUser extends StatefulWidget {
  @override
  _ViewUsageUserState createState() => _ViewUsageUserState();
}

class _ViewUsageUserState extends State<ViewUsageUser> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
        ),
        InkWell(
            onTap: () {},
            child: Card(
                child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.supervisor_account,
                    color: Colors.redAccent,
                    size: 35.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "View User Usage",
                    style: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ))),
      ],
    );
  }
}
