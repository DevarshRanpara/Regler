import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/Classes/user_data.dart';
import "package:flutter_app/CustomWidgets/Common/circular_image.dart";
import 'admin_dashboard.dart';
import 'director_dashboard.dart';
import 'package:flutter_app/Classes/admin_navigation.dart';
import 'package:flutter_app/Classes/preferances.dart';

class CommonHomeView extends StatelessWidget {
  final UserData data;
  final Nevigation nevigation;

  CommonHomeView(this.nevigation, this.data);

  Widget checkRole() {
    if (data.role == Strings.roleAdmin) {
      return AdminDashboard(nevigation);
    } else {
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
            padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 2.0),
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
                            Hero(
                              tag: Strings.heroProfile,
                              child: CircularImage(
                                NetworkImage(Preferances.imgurl),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              Strings.welcomeMr + data.name,
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
                nevigation.gotoUsage();
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
                            Icon(
                              Icons.notifications,
                              color: Colors.redAccent,
                              size: 35.0,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  Strings.yourUsage,
                                  style: TextStyle(color: Colors.tealAccent),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  data.used.toString() + Strings.minutes,
                                  style: TextStyle(
                                      color: Colors.white,
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
                        color: Colors.tealAccent,
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
