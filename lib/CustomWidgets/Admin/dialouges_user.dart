import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/CustomWidgets/Common/circular_image.dart';
import 'package:flutter_app/Models/manage_users_model.dart';
import 'package:flutter_app/Resources/user/user_bloc.dart';

class Dialogs {
  BuildContext buildContext;
  String message = Strings.loading;
  ManageUsersModel model;

  Dialogs(this.buildContext);

  void setMessage(String mess) {
    this.message = mess;
  }

  void show() {
    _showDialog();
  }

  void hide() {
    Navigator.pop(buildContext);
  }

  _showDialog() {
    showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 45.0,
            child: Center(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10.0),
                  CircularProgressIndicator(),
                  SizedBox(width: 20.0),
                  Text(
                    message,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  showAlertUserBlock(UserData user) {
    // model = ManageUsersModel();
    UserBloc bloc = UserBloc();
    String title;
    if (user.isBlcked) {
      title = Strings.unblockUser;
    } else {
      title = Strings.blockUser;
    }
    showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircularImage(
                      NetworkImage(user.url),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(user.name)
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              RawMaterialButton(
                child: Text(
                  Strings.yes,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                  bloc.blockUser(user);
                },
              ),
              RawMaterialButton(
                child: Text(
                  Strings.no,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                },
              )
            ],
          );
        });
  }

  showAlertUserDelete(UserData user) {
    model = ManageUsersModel();
    String title = Strings.deleteUser;
    showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircularImage(
                      NetworkImage(user.url),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(user.name)
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              RawMaterialButton(
                child: Text(
                  Strings.yes,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                  model.deleteUser(user);
                },
              ),
              RawMaterialButton(
                child: Text(
                  Strings.no,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                },
              )
            ],
          );
        });
  }

  showAlertUserChlimit(UserData user) {
    final formKey = new GlobalKey<FormState>();
    model = ManageUsersModel();
    String limit;
    String title = Strings.changeLimit;
    showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircularImage(
                      NetworkImage(user.url),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(user.name)
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Form(
                  key: formKey,
                  child: TextFormField(
                    validator: (val) {
                      if (int.parse(val) > 500) {
                        return Strings.maxLimit;
                      } else if (int.parse(val) < user.used) {
                        return Strings.limitError;
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) => limit = val,
                    decoration: InputDecoration(
                      hintText: Strings.enterNewLimit,
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                )
              ],
            ),
            actions: <Widget>[
              RawMaterialButton(
                child: Text(
                  Strings.yes,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  final form = formKey.currentState;
                  if (form.validate()) {
                    form.save();
                    model.chhangeLimit(user, limit);
                    Navigator.pop(buildContext);
                  }
                },
              ),
              RawMaterialButton(
                child: Text(
                  Strings.no,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                },
              )
            ],
          );
        });
  }
}
