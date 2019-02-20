import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/CustomWidgets/Admin/user_tile.dart';
import 'package:flutter_app/Models/view_usage_user_model.dart';

class ViewUsageUser extends StatefulWidget {
  final Function gotoUsage;
  ViewUsageUser(this.gotoUsage);
  @override
  _ViewUsageUserState createState() => _ViewUsageUserState();
}

class _ViewUsageUserState extends State<ViewUsageUser> {
  ViewUsageUserModel model = ViewUsageUserModel();

  List<UserData> users = List();

  List<UserTile> userTile = List();

  @override
  void initState() {
    users = model.getData();

    for (int i = 0; i < users.length; i++) {
      userTile.add(UserTile(users[i], widget.gotoUsage));
    }
    super.initState();
  }

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
        Column(
          children: userTile,
        )
      ],
    );
  }
}
