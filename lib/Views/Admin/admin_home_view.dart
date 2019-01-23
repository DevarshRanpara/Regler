import 'package:flutter/material.dart';

import 'package:flutter_app/Views/Profile/profile.dart';
import 'package:flutter_app/Models/admin_home_model.dart';
import 'package:flutter_app/CustomWidgets/common_home_view.dart';

class AdminHomeView extends StatefulWidget {

  final String role;

  AdminHomeView(this.role);

  @override
  _AdminHomeViewState createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {

  AdminHomeModel model;

  @override
    void initState() {
      if(widget.role=="admin"){
        model=AdminHomeModel("Admin","admin");
      }
      else{
        model=AdminHomeModel("Director","director");
      }
      super.initState();
    }

  void gotoProfile()
  {
    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => Profile(model.data.name,model.data.role)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Montserrat',
          accentColor: Colors.teal),
      home: Scaffold(
        body:CommonHomeView(gotoProfile,model.data.name,model.data.role)
        
      ),
    );
  }
}
