import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final Function gotoHome;

  LoginForm(this.gotoHome);

  @override
  Widget build(BuildContext context) {
    return Form(
      //key: _formKey,
      child: new Theme(
        data: new ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.teal,
            fontFamily: 'Montserrat',
            inputDecorationTheme: new InputDecorationTheme(
                labelStyle: new TextStyle(color: Colors.teal, fontSize: 17.0))),
        child: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new TextFormField(
                decoration:
                    new InputDecoration(labelText: "Enter Your Email ID"),
                keyboardType: TextInputType.emailAddress,
              ),
              new TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter some text";
                  }
                },
                decoration:
                    new InputDecoration(labelText: "Enter Your Password"),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              new Padding(padding: const EdgeInsets.only(top: 20.0)),
              new MaterialButton(
                height: 40.0,
                minWidth: 200.0,
                color: Colors.teal,
                textColor: Colors.white,
                child: new Text("Login"),
                onPressed: () {
                  gotoHome();
                },
                splashColor: Colors.tealAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
