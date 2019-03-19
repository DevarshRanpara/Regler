import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/complain.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Common/circular_image.dart';
import 'package:flutter_app/Models/view_complain_model.dart';

class ComplainTile extends StatelessWidget {
  final Complain complain;

  ComplainTile(this.complain);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        CircularImage(
                          NetworkImage(complain.imgurl),
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(complain.uname),
                      ],
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      _showAlertComplainDelete(context);
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
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
                          Text(Strings.delete),
                        ],
                      ),
                    ),
                    fillColor: Colors.red,
                    splashColor: Colors.redAccent,
                    shape: const StadiumBorder(),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      Strings.inst + complain.institute,
                      style: TextStyle(color: Colors.tealAccent),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      Strings.roomNo + complain.roomNO,
                      style: TextStyle(color: Colors.tealAccent),
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(complain.complain),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _showAlertComplainDelete(BuildContext context) {
    ViewComplainModel model = ViewComplainModel();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete Complain'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
              ],
            ),
            actions: <Widget>[
              RawMaterialButton(
                child: Text(
                  Strings.yes,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  model.deleteComplain(complain.id.toString());
                },
              ),
              RawMaterialButton(
                child: Text(
                  Strings.no,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
