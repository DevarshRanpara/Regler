import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/institute.dart';

class DialogsIns {
  BuildContext buildContext;

  DialogsIns(this.buildContext);

  showAlertInstituteBlock(Institute ins) {
    String title;
    if (ins.isBlocked) {
      title = "Unblock Institute";
    } else {
      title = "Block Institute";
    }
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
                  "Yes",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                },
              ),
              RawMaterialButton(
                child: Text(
                  "No",
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
    String title = "Delete Institute";
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
                  "Yes",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(buildContext);
                },
              ),
              RawMaterialButton(
                child: Text(
                  "No",
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
    String title = "Change Director";
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
                  "Yes",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
              RawMaterialButton(
                child: Text(
                  "No",
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
