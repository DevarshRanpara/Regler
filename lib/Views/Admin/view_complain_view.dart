import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/complain.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Admin/complain_tile.dart';
import 'package:flutter_app/Models/view_complain_model.dart';

class ViewComplainView extends StatefulWidget {
  @override
  _ViewComplainViewState createState() => _ViewComplainViewState();
}

class _ViewComplainViewState extends State<ViewComplainView> {
  ViewComplainModel model = ViewComplainModel();
  List<Complain> complains = List();
  List<ComplainTile> complainTile = List();

  @override
  void initState() {
    complains = model.getData();
    for (int i = 0; i < complains.length; i++) {
      complainTile.add(ComplainTile(complains[i]));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Container(
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
                          Icons.supervisor_account,
                          color: Colors.redAccent,
                          size: 35.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          Strings.viewComplains,
                          style: TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  ))),
              Column(children: complainTile)
            ],
          ),
        ));
  }
}
