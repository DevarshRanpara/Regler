import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:flutter_app/CustomWidgets/Common/dialog.dart';
import 'package:flutter_app/CustomWidgets/Common/expantion_tile.dart';
import 'package:flutter_app/Models/manage_users_model.dart';
import 'package:flutter_app/Classes/building.dart';

class AddUserView extends StatefulWidget {
  @override
  _AddUserViewState createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  String username;
  int userlimit;
  String institute = "Select Institute";
  Widget clgList;
  int limit;
  ManageUsersModel model;
  int insid;
  List<Widget> listTiles = List();
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final GlobalKey<AppExpansionTileState> expansionTile = new GlobalKey();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    model = ManageUsersModel();
    int n = Preferances.building.length;
    for (int i = 0; i < n; i++) {
      listTiles.add(genListTile(Preferances.building[i]));
    }

    super.initState();
  }

  genListTile(Building building) {
    return ListTile(
      title: Text(building.name),
      onTap: () {
        setState(() {
          this.institute = building.name;
          this.insid = building.id;
          expansionTile.currentState.collapse();
        });
      },
    );
  }

  selectInstitute() {
    if (Preferances.role == 'admin') {
      return Card(
          child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
              child: AppExpansionTile(
                  key: expansionTile,
                  title: Text(institute),
                  children: listTiles)));
    } else {
      insid=int.parse(Preferances.institute);
      institute='';
      return Card(
          child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Text("Institute : " + Preferances.institute)));
    }
  }

  showSnakbar(String msg) {
    final snackbar = new SnackBar(
      content: new Text(msg),
      backgroundColor: Colors.red,
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  _submit() async {
    final form = formKey.currentState;
    final form1 = formKey1.currentState;
    if (form.validate() && form1.validate()) {
      if (institute == 'Select Institute') {
        showSnakbar('Please select institute');
      } else {
        form.save();
        form1.save();
      Dialogs dialogs = Dialogs(context);
      dialogs.setMessage('Please Wait...');
      dialogs.show();
        String res = await model.addUser(username, insid, userlimit);
        if(res=='error'){
          showSnakbar('Username is already in use, Choose different one');
        }
        else{
          showSnakbar("User added successfully.");
        }
        dialogs.hide();
        //print(username + '\n' + userlimit.toString() + '\n' + insid.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Montserrat',
            accentColor: Colors.teal),
        home: Scaffold(
            key: scaffoldKey,
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
                        child: Form(
                          key: formKey1,
                          child: Card(
                              child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 2.0),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter Username'),
                                  validator: (val) {
                                    if (val.length > 12) {
                                      return 'Max username limit is 12';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) => username = val,
                                )
                              ],
                            ),
                          )),
                        )),
                    InkWell(onTap: () {}, child: selectInstitute()),
                    InkWell(
                        onTap: () {},
                        child: Card(
                            child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 2.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          'Enter Usage limit (In Minutes)'),
                                  keyboardType: TextInputType.number,
                                  validator: (val) => int.parse(val) > 500
                                      ? 'Maximum limit is 500'
                                      : null,
                                  onSaved: (val) => userlimit = int.parse(val),
                                )
                              ],
                            ),
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
                          _submit();
                        },
                      ),
                    ),
                  ],
                ))));
  }
}
