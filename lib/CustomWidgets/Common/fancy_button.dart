import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';

class FancyButton extends StatelessWidget {
  FancyButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.explore,
              color: Colors.amber,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              Strings.signup,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      fillColor: Colors.deepOrange,
      splashColor: Colors.orange,
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
