import 'package:flutter/material.dart';

import '../CustomWidgets/circular_image.dart';

class UpperDashboard extends StatelessWidget {

  final String name;
  final int bal;
  final Function addItem,gotoProfile;

  UpperDashboard(this.name,this.bal,this.addItem,this.gotoProfile);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
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
                        /*1*/
                        child: Row(
                          children: <Widget>[
                            CircularImage(
                              AssetImage("assets/dev.jpeg"),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Welcome Mr. "+name,
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
          Center(
            child: OutlineButton(
              child: Text("Turn On AC"),
              onPressed: () {addItem();},
              shape: const StadiumBorder(),
            ),
          ),
          InkWell(
              onTap: () {},
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
                              children: <Widget>[
                                Text("Remaining Balance ",style: TextStyle(color: Colors.white),),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  bal.toString()+" Minutes",
                                  style: TextStyle(
                                      color: Colors.redAccent,
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
              "Your Usage",
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