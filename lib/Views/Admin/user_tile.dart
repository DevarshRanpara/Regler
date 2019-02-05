import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/CustomWidgets/Common/circular_image.dart';

class UserTile extends StatelessWidget {
  final UserData data;
  final Function gotoUsage;

  UserTile(this.data,this.gotoUsage);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        gotoUsage(data);
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    CircularImage(
                      AssetImage("assets/dev.jpeg"),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text(
                        data.name,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Text(
                      data.institute,
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.redAccent,
                size: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
