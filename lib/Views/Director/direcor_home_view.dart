import 'package:flutter/material.dart';

import 'package:flutter_app/Views/Profile/profile.dart';
import 'package:flutter_app/CustomWidgets/common_home_view.dart';
import 'package:flutter_app/Models/admin_home_model.dart';

class DirHomeView extends StatefulWidget {
  @override
  _DirHomeViewState createState() => _DirHomeViewState();
}

class _DirHomeViewState extends State<DirHomeView> {

  AdminHomeModel model=AdminHomeModel("Director","director");

  void gotoProfile()
  {
    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => Profile(model.data.name,model.data.role)));
  }
  @override
  Widget build(BuildContext context) {
    return 
      MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Montserrat',
          accentColor: Colors.teal),
      home: Scaffold(
        body: CommonHomeView(gotoProfile,model.data.name,model.data.role)
      ),
    );
    
  }
}

//  Navigator.push(context,
//           MaterialPageRoute(builder: (BuildContext context) => Profile("Director","dir")));