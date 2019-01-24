import 'package:flutter/material.dart';
import 'package:flutter_app/CustomWidgets/circular_image.dart';
import 'package:flutter_app/CustomWidgets/expantion_tile.dart';



class UserDetailTile extends StatelessWidget {

  final String name;

  UserDetailTile(this.name);

  @override
  Widget build(BuildContext context) {
    return InkWell(
                onTap: () {},
                child: Card(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 2.0),
                        child: AppExpansionTile(
                          title: Row(
                            children: <Widget>[
                              CircularImage(
                                AssetImage("assets/dev.jpeg"),
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 10.0,),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.3,
                              child:Text(name), 
                              ),
                              //Text(name),
                              SizedBox(width: 10.0,),
                              Text("LJ MCA",
                              style: TextStyle(
                                color: Colors.tealAccent
                              ),
                              )
                            ],
                          ),
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Limit",
                                      ),
                                      Text("150 M")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Usage",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Text(
                                        "100 M",
                                        style:
                                            TextStyle(color: Colors.redAccent),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Bal",
                                          style: TextStyle(color: Colors.teal),
                                        ),
                                        Text(
                                          "50 M",
                                          style: TextStyle(
                                              color: Colors.tealAccent),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 5.0,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: RawMaterialButton(
                                    onPressed: () {},
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.timeline,
                                            size: 15.0,
                                          ),
                                          SizedBox(
                                            width: 2.0,
                                          ),
                                          Text("Ch. Limit"),
                                        ],
                                      ),
                                    ),
                                    fillColor: Colors.blue,
                                    splashColor: Colors.blueAccent,
                                    shape: const StadiumBorder(),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: RawMaterialButton(
                                    onPressed: () {},
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.block,
                                            size: 15.0,
                                          ),
                                          SizedBox(
                                            width: 2.0,
                                          ),
                                          Text("Block"),
                                        ],
                                      ),
                                    ),
                                    fillColor: Colors.orange,
                                    splashColor: Colors.orangeAccent,
                                    shape: const StadiumBorder(),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: RawMaterialButton(
                                    onPressed: () {},
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.delete,
                                            size: 15.0,
                                          ),
                                          SizedBox(
                                            width: 2.0,
                                          ),
                                          Text("Delete"),
                                        ],
                                      ),
                                    ),
                                    fillColor: Colors.red,
                                    splashColor: Colors.redAccent,
                                    shape: const StadiumBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))));
  }
}