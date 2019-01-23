import 'package:flutter/material.dart';

import "package:flutter_app/CustomWidgets/circular_image.dart";
import 'admin_dashboard.dart';
import 'director_dashboard.dart';
import 'package:flutter_app/Classes/admin_navigation.dart';

class CommonHomeView extends StatelessWidget {
  final AdminNevigation nevigation;
  final String name;
  final String role;


  CommonHomeView(this.nevigation, this.name,this.role);

  Widget checkRole()
  {
    if(role=="admin")
    {
      return AdminDashboard(nevigation);
    }
    else
    {
      return DirectorDashboard(nevigation);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 1.0, vertical: 2.0),
          ),
          InkWell(
              onTap: () {
                nevigation.gotoProfile();
              },
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            CircularImage(
                              AssetImage("assets/dev.jpeg"),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Welcome Mr. " + name,
                              style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.redAccent,
                      )
                    ],
                  ),
                ),
              )),
          InkWell(
              onTap: () {
                //data.gotoUsage();
              },
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        /*1*/
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Your usage",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "100 Minutes",
                                  style: TextStyle(
                                      color: Colors.tealAccent,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      /*3*/
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.redAccent,
                      )
                    ],
                  ),
                ),
              )),

          ////////////
          checkRole()
        ],
      ),
    );
  }
}
