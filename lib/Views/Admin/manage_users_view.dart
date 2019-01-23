import 'package:flutter/material.dart';

class ManageUsersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Montserrat',
          accentColor: Colors.teal),
      home: Scaffold(
        body: Center(
        child: Text("ManageUsersView"),
      ),
      )
    );
  }
}
