import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';

class LoadingAnimationCls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 25.0),
        child: SizedBox(
          height: 200,
          width: 200,
          child: FlareActor(
            Strings.loadingFlr,
            animation: Strings.loadingFlrAnimtion,
          ),
        ),
      ),
    );
  }
}
