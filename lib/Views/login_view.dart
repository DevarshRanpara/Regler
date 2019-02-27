import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/Models/login_model.dart';
import './User/home_page.dart';
import './Admin/admin_home_view.dart';
import 'package:flutter_app/CustomWidgets/Common/dialog.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: Strings.title,
      home: new HomePage(),
      theme: new ThemeData(
          fontFamily: Strings.fontFamily,
          primarySwatch: Colors.red,
          brightness: Brightness.dark,
          accentColor: Colors.red),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<HomePage>{

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _userId;
  String _password;

  @override
  void initState() {
    super.initState();
  }

  void _submit() async {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      Dialogs dialogs = Dialogs(context);
      dialogs.setMessage(Strings.signInMessage);
      dialogs.show();
      var loginModel = LoginModel(_userId, _password);
      String res = await loginModel.auth();
      dialogs.hide();
      _gotoHome(res);
    }
  }

  void _gotoHome(String role) {
    if (role == Strings.roleUser) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => UserMainPage()));
    } else if (role == Strings.roleDirector || role == Strings.roleAdmin) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => AdminHomeView(role)));
    } else if (role == Strings.userBlocked) {
      showSnakbar(Strings.userBlockMessage);
    } else {
      showSnakbar(Strings.invalidUserMessage);
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
        resizeToAvoidBottomPadding: false, key: scaffoldKey, body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image(
              image: new AssetImage(Strings.loginBackgroundImage),
              fit: BoxFit.cover,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken,
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlutterLogo(
                  size: 100.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: new Theme(
                      data: new ThemeData(
                          brightness: Brightness.dark,
                          primarySwatch: Colors.teal,
                          fontFamily: Strings.fontFamily,
                          inputDecorationTheme: new InputDecorationTheme(
                              labelStyle: new TextStyle(
                                  color: Colors.teal, fontSize: 17.0))),
                      child: new Container(
                        padding: const EdgeInsets.all(40.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              decoration: new InputDecoration(
                                  labelText: Strings.enterUserIdMsg),
                              validator: (val) {
                                if (val.length > 12 || val.isEmpty) {
                                  return Strings.errorInvaliduserID;
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (val) => _userId = val,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextFormField(
                              decoration: new InputDecoration(
                                  labelText: Strings.enterPasswordMsg),
                              validator: (val) =>
                                  val.length < 8 ? Strings.errorPasswordShort : null,
                              onSaved: (val) => _password = val,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            new Padding(
                                padding: const EdgeInsets.only(top: 20.0)),
                            new MaterialButton(
                              height: 40.0,
                              minWidth: 200.0,
                              color: Colors.teal,
                              textColor: Colors.white,
                              child: new Text(Strings.btnLogin),
                              onPressed: () {
                                _submit();
                              },
                              splashColor: Colors.tealAccent,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
