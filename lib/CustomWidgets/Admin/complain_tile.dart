import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/complain.dart';
import 'package:flutter_app/Classes/strings.dart';
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
                          AssetImage(Strings.defImage),
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
                  Text(Strings.inst + complain.institute,
                  style: TextStyle(color: Colors.tealAccent),
                  ),
                  SizedBox(width: 30.0,),
                  Text(Strings.roomNo + complain.roomNO,
                  style: TextStyle(color: Colors.tealAccent),
                  )
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
