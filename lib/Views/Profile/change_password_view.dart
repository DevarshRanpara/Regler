import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/gen_string.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Common/dialog.dart';
import 'package:http/http.dart' as http;

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String oldpassword, newpassword, newpassword1;

  void _submit() async {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      if (oldpassword == newpassword) {
        showSnakbar(Strings.oldPassError);
      } else {
        //showSnakbar('Valid');
        Dialogs dialogs = Dialogs(context);
        dialogs.setMessage(Strings.pleaseWait);
        dialogs.show();
        String res = await changePassword();
        dialogs.hide();
        showSnakbar(res);
      }
    }
  }

  Future<String> changePassword() async {
    String url = GenerateString.genStringChpass(oldpassword, newpassword);
    var response = await http.get(
      Uri.encodeFull(url),
    );
    if (response.body.toString() == Strings.updated) {
      return Strings.passChanged;
    } else {
      return Strings.invalidPass;
    }
  }

  void showSnakbar(String msg) {
    final snackbar = new SnackBar(
      content: new Text(msg),
      backgroundColor: Colors.red,
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: ListView(
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
                  child: Column(
                    children: <Widget>[
                      Hero(
                        tag: Strings.heroChpass,
                        child: Icon(
                          Icons.security,
                          color: Colors.redAccent,
                          size: 35.0,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        Strings.chPass,
                        style: TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                ))),
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  InkWell(
                      onTap: () {},
                      child: Card(
                          child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 2.0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: Strings.chPassHint),
                              obscureText: true,
                              validator: (val) =>
                                  val.length < 8 ? Strings.chPassError : null,
                              onSaved: (val) => oldpassword = val,
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
                            TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: Strings.newPassHint),
                              obscureText: true,
                              validator: (val) {
                                if (val.length < 8) {
                                  return Strings.chPassError;
                                } else {
                                  newpassword = val;
                                  return null;
                                }
                              },
                              onSaved: (val) => newpassword = val,
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
                            TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: Strings.confirmChpassHint),
                              obscureText: true,
                              validator: (val) {
                                if (val == newpassword) {
                                  return null;
                                } else {
                                  return Strings.passNotMatch;
                                }
                              },
                              onSaved: (val) => newpassword1 = val,
                            )
                          ],
                        ),
                      ))),
                  Center(
                    child: RaisedButton(
                      color: Colors.teal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.check),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            Strings.chPass,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      onPressed: () {
                        _submit();
                      },
                      splashColor: Colors.tealAccent,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
