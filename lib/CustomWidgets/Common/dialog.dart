import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';

class Dialogs {
  BuildContext buildContext;
  String message = Strings.loading;

  Dialogs(this.buildContext);

  void setMessage(String mess) {
    this.message = mess;
  }

  void show() {
    _showDialog();
  }

  void hide() {
    Navigator.pop(buildContext);
  }

  _showDialog() {
    showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: SizedBox(
            height: 45.0,
            child: Center(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10.0),
                  CircularProgressIndicator(),
                  SizedBox(width: 20.0),
                  Text(
                    message,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
