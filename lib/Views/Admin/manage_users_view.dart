import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/CustomWidgets/Admin/dialouges_user.dart';
import 'package:flutter_app/Models/manage_users_model.dart';
import 'package:flutter_app/CustomWidgets/Admin/user_detail.dart';
import 'add_user_view.dart';

//import 'package:flutter_app/Resources/bloc.dart';

class ManageUsersView extends StatefulWidget {
  @override
  _ManageUsersViewState createState() => _ManageUsersViewState();
}

class _ManageUsersViewState extends State<ManageUsersView> {
  List<UserDetailTile> list = List();
  ManageUsersModel model;
  List<UserData> user;
  Stream<List<UserData>> stream;
  Dialogs dialogs;

  @override
  void initState() {
    dialogs = Dialogs(context);
    model = ManageUsersModel();
    stream = Stream.fromFuture(model.getData());
    //bloc.fetchAllUsers();
    super.initState();
  }

  @override
  void dispose() {
    //bloc.dispose();
    super.dispose();
  }

  void blockUser(UserData user) {
    dialogs.showAlertUserBlock(user);
  }

  void deleteUser(UserData user) {
    dialogs.showAlertUserDelete(user);
  }

  void changeLimit(UserData user){
    dialogs.showAlertUserChlimit(user);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Montserrat',
            accentColor: Colors.teal),
        home: Scaffold(
            body: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.95,
                child: StreamBuilder(
                  //stream: bloc.allUsers,
                  stream: stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.length + 1,
                        itemBuilder: (BuildContext conext, int i) {
                          if (i == 0) {
                            return getUpperUI();
                          }
                          return UserDetailTile(
                              snapshot.data[i - 1], blockUser, deleteUser,changeLimit);
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        )));
  }

  Widget getUpperUI() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
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
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
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
                        "Manage Users",
                        style: TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                ),
              ))),
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
        ],
      ),
    );
  }
}
