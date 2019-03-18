import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/Classes/user_usage.dart';
import 'package:flutter_app/CustomWidgets/Common/circular_image.dart';

class UserReport extends StatelessWidget {
  final UserUsage data;

  UserReport(this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showUsageReportDialouge(context);
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                /*1*/
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*2*/
                    Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.date_range),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            data.date,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.timelapse),
                        SizedBox(width: 8.0),
                        Text(
                          data.startingTime + Strings.to + data.endingTime,
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /*3*/
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.red[500],
              ),
              Text(data.use.toString() + Strings.min),
            ],
          ),
        ),
      ),
    );
  }

  showUsageReportDialouge(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('User Usage'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircularImage(
                      NetworkImage(data.imgurl),
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(data.uname),
                  ],
                ),
                SizedBox(height: 15.0,),
                Row(
                  children: <Widget>[
                    Icon(Icons.location_city),
                    SizedBox(width: 8.0),
                    Text(
                      data.institute,
                    ),
                  ],
                ),
                SizedBox(height: 15.0,),
                Row(
                  children: <Widget>[
                    Icon(Icons.crop_square),
                    SizedBox(width: 8.0),
                    Text(
                      data.room,
                    ),
                  ],
                ),
                SizedBox(height: 15.0,),
                Row(
                  children: <Widget>[
                    Icon(Icons.date_range),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      data.date,
                    ),
                  ],
                ),
                SizedBox(height: 15.0,),
                Row(
                  children: <Widget>[
                    Icon(Icons.timelapse),
                    SizedBox(width: 8.0),
                    Text(
                      data.startingTime + Strings.to + data.endingTime,
                    ),
                  ],
                ),
                SizedBox(height: 15.0,),
                Row(
                  children: <Widget>[
                    Icon(Icons.alarm),
                    SizedBox(width: 8.0),
                    Text(data.use.toString() + Strings.min),
                  ],
                ),
                SizedBox(height: 15.0,),
                Row(
                  children: <Widget>[
                    Text('Temp . '),
                    SizedBox(width: 8.0),
                    Text(data.temp.toString()),
                  ],
                ),
                SizedBox(height: 15.0,),
                Row(
                  children: <Widget>[
                    Text('Hum . '),
                    SizedBox(width: 8.0),
                    Text(data.hum.toString()),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              RawMaterialButton(
                child: Text(
                  Strings.ok,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
