import 'package:flutter/material.dart';
//import 'package:flutter_app/CustomWidgets/circular_image.dart';
//import 'package:flutter_app/CustomWidgets/user_expantion_tile.dart';
import 'package:flutter_app/CustomWidgets/user_detail.dart';

class ManageUsersView extends StatefulWidget {
  @override
  _ManageUsersViewState createState() => _ManageUsersViewState();
}

class _ManageUsersViewState extends State<ManageUsersView> {

  List<UserDetailTile> list=List();
  List<String> names=['Devarsh','Dhaval','Nilesh','Ravi'];

  @override
    void initState() {
      for(int i=0;i<names.length;i++){
        _addItem(names[i]);
      }
      
      super.initState();
    }

    void _addItem(String name)
    {
      list.add(UserDetailTile(name));
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
                onTap: () {},
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
            Column(children: list,)
          ],
        )));
  }
}
