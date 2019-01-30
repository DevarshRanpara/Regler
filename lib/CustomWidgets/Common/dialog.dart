import 'package:flutter/material.dart';

class Dialogs {
  waiting(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child:Padding(
              padding: EdgeInsets.all(20.0),
              child:  Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 10.0,),
                Text("Signing in"),
              ],
            ),
            )
          );
        });
  }
}
