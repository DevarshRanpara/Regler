import 'package:flutter/material.dart';


class UserReport extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
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
                          SizedBox(width: 8,),
                          Text(
                            '10th, Jan, 2019',
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
                          '10:12 AM to 12:02 PM',
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
              Text('110 Min'),

            ],
          ),
        ),
      ),
    );
  }
}
