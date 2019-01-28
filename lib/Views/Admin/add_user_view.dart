import 'package:flutter/material.dart';
import 'package:flutter_app/CustomWidgets/Common/expantion_tile.dart';
import 'package:flutter_app/Models/manage_users_model.dart';

class AddUserView extends StatefulWidget {
  @override
  _AddUserViewState createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  String institute = "Select Institute";
  String name;
  int limit;
  ManageUsersModel model;

  final GlobalKey<AppExpansionTileState> expansionTile = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Montserrat',
            accentColor: Colors.teal),
        home: Scaffold(
            body: Container(
                margin: EdgeInsets.all(8.0),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 2.0),
                    ),
                    InkWell(
                        onTap: () {},
                        child: Card(
                            child: Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.person_add,
                                color: Colors.redAccent,
                                size: 35.0,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "Add User",
                                style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w200),
                              )
                            ],
                          ),
                        ))),
                    InkWell(
                        onTap: () {},
                        child: Card(
                            child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 2.0),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                onChanged: (String val) {
                                  setState(() {
                                    name = val;
                                  });
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Username'),
                              )
                            ],
                          ),
                        ))),
                    InkWell(
                        onTap: () {},
                        child: Card(
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 2.0),
                                child: AppExpansionTile(
                                  key: expansionTile,
                                  title: Text(institute),
                                  children: <Widget>[
                                    ListTile(
                                      title: Text("LJ MCA"),
                                      onTap: () {
                                        setState(() {
                                          this.institute = "LJ MCA";
                                          expansionTile.currentState.collapse();
                                        });
                                      },
                                    ),
                                    ListTile(
                                      title: Text("LJ MBA"),
                                      onTap: () {
                                        setState(() {
                                          this.institute = "LJ MBA";
                                          expansionTile.currentState.collapse();
                                        });
                                      },
                                    ),
                                    ListTile(
                                      title: Text("LJ Engg."),
                                      onTap: () {
                                        setState(() {
                                          this.institute = "LJ Engg.";
                                          expansionTile.currentState.collapse();
                                        });
                                      },
                                    )
                                  ],
                                )))),
                    InkWell(
                        onTap: () {},
                        child: Card(
                            child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 2.0),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                onChanged: (String val) {
                                  setState(() {
                                    limit = int.parse(val);
                                  });
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Usage limit (In Minutes)'),
                                keyboardType: TextInputType.number,
                              )
                            ],
                          ),
                        ))),
                    InkWell(
                        onTap: () {},
                        child: Card(
                            child: Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Text("Upload Profile Picture")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ))),
                    Center(
                      child: RaisedButton(
                        color: Colors.blue,
                        splashColor: Colors.blueAccent,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.add),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Add User",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        onPressed: () {
                          //model.addUser(name,institute,limit);
                        },
                      ),
                    ),
                  ],
                ))));
  }
}
