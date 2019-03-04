import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_app/Classes/strings.dart';

class InternetError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FlareActor(
          Strings.flareImage,
          animation: Strings.flareAnimation,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Center(
                child: Padding(
              padding: EdgeInsets.only(bottom: 70.0),
              child: Text(
                Strings.internetError,
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            ))
          ],
        )
      ],
    );
  }
}
