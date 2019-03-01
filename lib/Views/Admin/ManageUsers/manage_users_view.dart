import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Admin/dialouges_user.dart';
import 'package:flutter_app/Views/Admin/ManageUsers/add_user_view.dart';
import 'package:flutter_app/Views/Admin/ManageUsers/manage_director.dart';
import 'package:flutter_app/Views/Admin/ManageUsers/manage_user.dart';

class ManageUsersView extends StatefulWidget {
  @override
  _ManageUsersViewState createState() => _ManageUsersViewState();
}

class _ManageUsersViewState extends State<ManageUsersView> {
  List<Widget> pages;
  int _selectedIndex = 0;

  Dialogs dialogs;

  @override
  void initState() {
    
    dialogs = Dialogs(context);

    Widget user = ManageUser(addUser, dialogs);
    Widget dir = ManageDir(addUser, dialogs);
    pages = [user, dir];
    super.initState();
  }

  addUser() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => AddUserView()));
  }

  @override
  Widget build(BuildContext context) {
    if (Preferances.role == Strings.roleAdmin) {
      return MaterialApp(
          theme: ThemeData(
              brightness: Brightness.dark,
              fontFamily: Strings.fontFamily,
              accentColor: Colors.teal),
          home: Scaffold(
            body: Container(
              child: pages.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.supervisor_account), title: Text(Strings.mngUser)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.verified_user), title: Text(Strings.mngDir))
              ],
              currentIndex: _selectedIndex,
              fixedColor: Colors.tealAccent,
              onTap: _onItemTapped,
            ),
          ));
    } else {
      return MaterialApp(
          theme: ThemeData(
              brightness: Brightness.dark,
              fontFamily: Strings.fontFamily,
              accentColor: Colors.teal),
          home: Scaffold(
            body: Container(
              child: ManageUser(addUser, dialogs),
            ),
          ));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
