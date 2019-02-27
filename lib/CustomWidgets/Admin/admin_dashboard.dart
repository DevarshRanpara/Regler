import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/admin_navigation.dart';
import 'package:flutter_app/Classes/strings.dart';

class AdminDashboard extends StatelessWidget {
  final Nevigation nevigation;

  final boxHeight = 0.218;
  final boxWidth = 0.47;

  AdminDashboard(this.nevigation);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
                onTap: () {
                  nevigation.gotoManageUsers();
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * boxHeight,
                  width: MediaQuery.of(context).size.width * boxWidth,
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Icon(
                                    Icons.supervisor_account,
                                    color: Colors.redAccent,
                                    size: 35.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(Strings.lblmngUser)
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.tealAccent,
                            size: 35.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            InkWell(
                onTap: () {
                  nevigation.gotoManageBuildings();
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * boxHeight,
                  width: MediaQuery.of(context).size.width * boxWidth,
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Icon(
                                    Icons.location_city,
                                    color: Colors.redAccent,
                                    size: 35.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(Strings.lblmgnIns)
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.tealAccent,
                            size: 35.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
                onTap: () {
                  nevigation.gotoManageRooms();
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * boxHeight,
                  width: MediaQuery.of(context).size.width * boxWidth,
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Icon(
                                    Icons.crop_square,
                                    color: Colors.redAccent,
                                    size: 35.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(Strings.lblmngRooms)
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.tealAccent,
                            size: 35.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            InkWell(
                onTap: () {
                  nevigation.gotoViewUsage();
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * boxHeight,
                  width: MediaQuery.of(context).size.width * boxWidth,
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Icon(
                                    Icons.timeline,
                                    color: Colors.redAccent,
                                    size: 35.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(Strings.lblViewUsage)
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.tealAccent,
                            size: 35.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 2.0),
              child: InkWell(
                  onTap: () {
                    nevigation.gotoViewComplains();
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * boxHeight,
                    width: MediaQuery.of(context).size.width * boxWidth,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Icon(
                                      Icons.error,
                                      color: Colors.redAccent,
                                      size: 35.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(Strings.lblViewComplain)
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.tealAccent,
                              size: 35.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
