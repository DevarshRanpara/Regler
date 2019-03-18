import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Admin/complain_tile.dart';
import 'package:flutter_app/CustomWidgets/Common/loading_animation.dart';
import 'package:flutter_app/Models/view_complain_model.dart';

class ViewComplainView extends StatefulWidget {
  @override
  _ViewComplainViewState createState() => _ViewComplainViewState();
}

class _ViewComplainViewState extends State<ViewComplainView> {
  ViewComplainModel model = ViewComplainModel();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      margin: EdgeInsets.all(8.0),
      child: 
      FutureBuilder(
      future: model.getData(),
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
              return ComplainTile(snapshot.data[i - 1]);
            },
          );
        }
      },
    )
      ));
  }

  _getUpperUI() {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
          ),
          InkWell(
              onTap: () {},
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
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
                ),
              ))),
        ],
      ),
    );
  }
}
