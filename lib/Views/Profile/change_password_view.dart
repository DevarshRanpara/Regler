import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String oldpassword, newpassword, newpassword1;

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      if(oldpassword==newpassword){
        showSnakbar("Old password can't be New Password");
      }
      else{
        showSnakbar('Valid');
      }
      
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
                        Icon(
                          Icons.security,
                          color: Colors.redAccent,
                          size: 35.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Change Password",
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
                                    hintText: 'Enter old Password'),
                                obscureText: true,
                                validator: (val) => val.length < 8
                                    ? 'Password too short'
                                    : null,
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
                                    hintText: 'Enter new Password'),
                                obscureText: true,
                                validator: (val) {
                                  if(val.length<8){
                                    return 'Password too short';
                                  }
                                  else{
                                    newpassword=val;
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
                                    hintText: 'Confirm new Password'),
                                obscureText: true,
                                validator: (val){
                                  if(val==newpassword){
                                    return null;
                                  }
                                  else{
                                    return "Passwords not match";
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
                              "Change Password",
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
      ),
    );
  }
}
