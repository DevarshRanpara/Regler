import 'package:flutter/material.dart';


import 'package:flutter_app/CustomWidgets/fancy_button.dart';
import 'package:flutter_app/CustomWidgets/login_form.dart';
import 'home_page.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "New App",
      home: new HomePage(),
      theme: new ThemeData(
          fontFamily: 'Montserrat',
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

  //final _formKey = GlobalKey<FormState>();

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

  void _gotoHome(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       new Stack(
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
              new LoginForm(_gotoHome)
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
