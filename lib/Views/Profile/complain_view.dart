import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';

import 'package:flutter_app/CustomWidgets/Common/expantion_tile.dart';

class Complain extends StatefulWidget {
  @override
  _ComplainState createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {
  String expantitle = Strings.selectAc;
  final GlobalKey<AppExpansionTileState> expansionTile = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
              ),
              InkWell(
                  onTap: () {},
                  child: Card(
                      child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.error,
                          color: Colors.redAccent,
                          size: 35.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          Strings.complain,
                          style: TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  ))),
              InkWell(
                  onTap: () {},
                  child: Card(
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 2.0),
                          child: AppExpansionTile(
                            key: expansionTile,
                            title: Text(expantitle),
                            children: <Widget>[
                              ListTile(
                                title: Text("AC 101"),
                                onTap: () {
                                  setState(() {
                                    this.expantitle = "AC 101";
                                    expansionTile.currentState.collapse();
                                  });
                                },
                              ),
                              ListTile(
                                title: Text("AC 102"),
                                onTap: () {
                                  setState(() {
                                    this.expantitle = "AC 102";
                                    expansionTile.currentState.collapse();
                                  });
                                },
                              ),
                              ListTile(
                                title: Text("AC 103"),
                                onTap: () {
                                  setState(() {
                                    this.expantitle = "AC 103";
                                    expansionTile.currentState.collapse();
                                  });
                                },
                              )
                            ],
                          )))),
              InkWell(
                  onTap: () {},
                  child: Card(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 5.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: Strings.enterDetails),
                        )
                      ],
                    ),
                  ))),
              Center(
                child: RaisedButton(
                  color: Colors.teal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.check),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        Strings.btnSubmit,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  onPressed: () {},
                  splashColor: Colors.tealAccent,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
