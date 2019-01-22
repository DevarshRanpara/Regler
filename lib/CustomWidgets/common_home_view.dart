import 'package:flutter/material.dart';

import "package:flutter_app/CustomWidgets/circular_image.dart";

class CommonHomeView extends StatelessWidget {
  final Function gotoProfile;
  final String name;

  CommonHomeView(this.gotoProfile, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
          ),
          InkWell(
              onTap: () {
                gotoProfile();
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
                                  "Remaining Balance ",
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
                Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.47,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.supervisor_account,
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text("Manage Users")
                          ],
                        ),
                      ),
                    ),
                  )),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.47,
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.location_city,
                            color: Colors.red,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text("Manage Building")
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.47,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.supervisor_account,
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text("Manage Users")
                          ],
                        ),
                      ),
                    ),
                  )),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.47,
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.location_city,
                            color: Colors.red,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text("Manage Building")
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.47,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.supervisor_account,
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text("Manage Users")
                          ],
                        ),
                      ),
                    ),
                  )),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.47,
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.location_city,
                            color: Colors.red,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text("Manage Building")
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
