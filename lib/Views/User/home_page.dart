import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Common/circular_image.dart';
import 'package:flutter_app/CustomWidgets/Common/loading_animation.dart';
import 'package:flutter_app/CustomWidgets/Common/usage_report_user.dart';
import 'package:flutter_app/Models/view_usage_user_model.dart';
import 'package:flutter_app/Views/Profile/profile.dart';
import './usage_detail_view.dart';

class UserMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePageView();
  }
}

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  ViewUsageUserModel model = ViewUsageUserModel();

  void _gotoProfile() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Profile()));
  }

  void _gotoUsage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                UsageDetail(int.parse(Preferances.use), int.parse(Preferances.limit))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: FutureBuilder(
      future: model.getUsage(Preferances.id.toString()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return LoadingAnimationCls();
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length + 1,
            itemBuilder: (BuildContext conext, int i) {
              if (i == 0) {
                return _getUpperUI();
              }
              return UserReport(snapshot.data[i - 1]);
            },
          );
        }
      },
    ),
        // child: ListView(
        //   children: <Widget>[
        //     Padding(
        //       padding:
        //           const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
        //     ),
        //     // _getUpperUI(),
        //   ],
        // ),
      ),
    );
  }

  _getUpperUI() {
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
              onTap: () {
                _gotoProfile();
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
                              Strings.welcomeMr + Preferances.name,
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
                _gotoUsage();
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
                                  Strings.remBal,
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  Preferances.bal.toString() + Strings.minutes,
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
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              Strings.yourUsage,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}
