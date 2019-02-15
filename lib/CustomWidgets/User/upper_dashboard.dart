import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/preferances.dart';

import 'package:flutter_app/CustomWidgets/Common/circular_image.dart';
import 'package:flutter_app/Classes/user_data.dart';

import 'package:flutter_app/Classes/admin_navigation.dart';

class UpperDashboard extends StatelessWidget {
  final UserData data;
  final Nevigation nevigation;
  UpperDashboard(this.data, this.nevigation);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
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
                        /*1*/
                        child: Row(
                          children: <Widget>[
                            CircularImage(
                              NetworkImage(Preferances.imgurl),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Welcome Mr. " + data.name,
                              style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      /*3*/
                      Icon(
                        Icons.settings,
                        color: Colors.redAccent,
                      )
                    ],
                  ),
                ),
              )),
          // Center(
          //   child: OutlineButton(
          //     child: Text("Turn On AC"),
          //     onPressed: () {
          //       addItem();
          //     },
          //     shape: const StadiumBorder(),
          //   ),
          // ),
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
                                  "Remaining Balance ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  data.bal.toString() + " Minutes",
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
        ],
      ),
    );
  }
}
