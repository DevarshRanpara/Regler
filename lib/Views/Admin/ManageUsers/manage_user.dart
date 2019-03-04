import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/functions.dart';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/CustomWidgets/Admin/dialouges_user.dart';
import 'package:flutter_app/CustomWidgets/Admin/user_detail.dart';
import 'package:flutter_app/CustomWidgets/Common/loading_animation.dart';
import 'package:flutter_app/Models/manage_users_model.dart';

class ManageUser extends StatefulWidget {
  final Dialogs dialogs;

  final Function addUser;

  ManageUser(this.addUser, this.dialogs);

  @override
  _ManageUserState createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {
  ManageFunctions functions;

  ManageUsersModel model;
  Stream<List<UserData>> stream;
  double height;

  @override
  void initState() {
    if (Preferances.role == Strings.roleAdmin) {
      height = 0.87;
    } else {
      height = 0.95;
    }
    functions = ManageFunctions(
        block: blockUser, change: changeLimit, delete: deleteUser);
    model = ManageUsersModel();
    // _setStream();
    //bloc.fetchAllUsers();
    stream = Stream.fromFuture(model.getData());
    super.initState();
  }

  // _setStream(){
  //   Timer.periodic(Duration(seconds: 10), (Timer value){
  //     stream = Stream.fromFuture(model.getData());
  //   });
  // }

  @override
  void dispose() {
    //bloc.dispose();
    Preferances.institutes.clear();
    super.dispose();
  }

  void blockUser(UserData user) {
    widget.dialogs.showAlertUserBlock(user);
    model.getData();
  }

  void deleteUser(UserData user) {
    widget.dialogs.showAlertUserDelete(user);
    model.getData();
  }

  void changeLimit(UserData user) {
    widget.dialogs.showAlertUserChlimit(user);
    model.getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * height,
          child: StreamBuilder(
            //stream: bloc.allUsers,
            stream: stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return LoadingAnimationCls();
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length + 1,
                  itemBuilder: (BuildContext conext, int i) {
                    if (i == 0) {
                      return getUpperUI();
                    }
                    return UserDetailTile(snapshot.data[i - 1], functions);
                  },
                );
              }
            },
          ),
        )
      ],
    );
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
                        Strings.mngUser,
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
                widget.addUser();
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
                        Strings.addUser,
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
