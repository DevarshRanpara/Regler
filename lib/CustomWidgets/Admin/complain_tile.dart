import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/complain.dart';
import 'package:flutter_app/CustomWidgets/Common/circular_image.dart';

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
                          AssetImage("assets/dev.jpeg"),
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(complain.uname)
                      ],
                    ),
                  ),
                  Text("AC No. " + complain.acNo)
                ],
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
}
