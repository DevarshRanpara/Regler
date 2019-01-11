import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'fancy_button.dart';

void main() {
  //debugPaintSizeEnabled=true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "New App",
      home: new HomePage(),
      theme: new ThemeData(
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

class LoginPageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconanimationController;
  Animation<double> _iconAniamation;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _iconanimationController = new AnimationController(
        vsync: this, duration: new Duration(microseconds: 5000));

    _iconAniamation = new CurvedAnimation(
        parent: _iconanimationController, curve: Curves.easeInOut);

    _iconAniamation.addListener(() => this.setState(() {}));

    _iconanimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/girl.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAniamation.value * 100,
              ),
              new Form(
                key: _formKey,
                child: new Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              color: Colors.teal, fontSize: 17.0))),
                  child: new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Enter Your Email ID"),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter some text";
                            }
                          },
                          decoration: new InputDecoration(
                              labelText: "Enter Your Password"),
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
                          onPressed: () => {},
                          splashColor: Colors.redAccent,
                        ),
//                      new Padding(padding: const EdgeInsets.only(top: 10.0)),
//                      new MaterialButton(
//                        height: 40.0,
//                        minWidth: 200.0,
//                        color: Colors.teal,
//                        textColor: Colors.white,0
//                        child: new Text("Signup"),
//                        onPressed: () => {},
//                        splashColor: Colors.redAccent,
//                      )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FancyButton(
        onPressed: (){},
      ), 
    );
  }
}
