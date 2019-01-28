import 'package:flutter/material.dart';

import 'package:flutter_app/CustomWidgets/Common/circular_image.dart';
import 'package:flutter_app/CustomWidgets/Common/expantion_tile.dart';
import 'package:flutter_app/Classes/building.dart';

class ManageBuildingTile extends StatefulWidget {

  final Building building;

  ManageBuildingTile(this.building);

  @override
  _ManageBuildingTileState createState() => _ManageBuildingTileState();
}

class _ManageBuildingTileState extends State<ManageBuildingTile> {
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
                            Icon(Icons.location_city, color: Colors.red),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(widget.building.name)
                          ],
                        ),
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Column(
                                  children: <Widget>[
                                    Text("Director : "),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: CircularImage(
                                        AssetImage("assets/dev.jpeg"),
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(widget.building.director),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5.0,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
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
                                          Icons.supervised_user_circle,
                                          size: 15.0,
                                        ),
                                        SizedBox(
                                          width: 2.0,
                                        ),
                                        Text("Ch. Dir."),
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
                                width: MediaQuery.of(context).size.width * 0.3,
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
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: RawMaterialButton(
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                          )
                        ],
                      )),
                ),
              );
  }
}