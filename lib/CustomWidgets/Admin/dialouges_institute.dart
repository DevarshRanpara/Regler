import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/institute.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/Models/manage_institute_model.dart';

class DialogsIns {
  BuildContext buildContext;

  DialogsIns(this.buildContext);

  showAlertInstituteBlock(Institute ins) {
    ManageInstituteModel model = ManageInstituteModel();

    String title;
    if (ins.isBlocked) {
      title = Strings.unblockIns;
    } else {
      title = Strings.blockIns;
    }
    showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.location_city, color: Colors.red),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(ins.name)
                  ],
                )
              ],
            ),
            actions: <Widget>[
              RawMaterialButton(
                child: Text(
                  Strings.yes,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                  model.blockIns(ins);
                },
              ),
              RawMaterialButton(
                child: Text(
                  Strings.no,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                },
              )
            ],
          );
        });
  }

  showAlertInstituteDelete(Institute ins) {
    String title = Strings.deleteIns;
    showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.location_city, color: Colors.red),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(ins.name)
                  ],
                )
              ],
            ),
            actions: <Widget>[
              RawMaterialButton(
                child: Text(
                  Strings.yes,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                },
              ),
              RawMaterialButton(
                child: Text(
                  Strings.no,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                },
              )
            ],
          );
        });
  }

  showAlertInstituteChDir(Institute ins) {
    String title = Strings.chDir;
    showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[],
            ),
            actions: <Widget>[
              RawMaterialButton(
                child: Text(
                  Strings.yes,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
              RawMaterialButton(
                child: Text(
                  Strings.no,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                },
              )
            ],
          );
        });
  }
}
