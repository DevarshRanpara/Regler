import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/users.dart';
import 'package:flutter_app/Models/manage_users_model.dart';
import 'package:flutter_app/CustomWidgets/Admin/user_detail.dart';

import 'add_user_view.dart';

class ManageUsersView extends StatefulWidget {
  @override
  _ManageUsersViewState createState() => _ManageUsersViewState();
}

class _ManageUsersViewState extends State<ManageUsersView> {
  List<UserDetailTile> list = List();
  ManageUsersModel model = ManageUsersModel();
  List<Users> user;

  @override
  void initState() {
    user = model.getData();
    for (int i = 0; i < user.length; i++) {
      list.add(UserDetailTile(user[i]));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Montserrat',
            accentColor: Colors.teal),
        home: Scaffold(
            body: ListView(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => AddUserView()));
                },
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Add User",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )),
            Column(
              children: list,
            )
          ],
        )));
  }
}
