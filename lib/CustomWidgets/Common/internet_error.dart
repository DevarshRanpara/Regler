import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class InternetError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FlareActor(
              "assets/space_demo.flr",
              animation: 'loading',
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(bottom: 70.0),
                  child: Text(
                    "You are not connected to internet",
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ))
              ],
            )
          ],
        );
  }
}