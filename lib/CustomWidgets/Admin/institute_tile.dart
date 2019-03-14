import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/institute.dart';

class InstituteTile extends StatelessWidget {
  final Function gotoRoom;

  final Institute data;

  InstituteTile(this.data, this.gotoRoom);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        gotoRoom(data.id);
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text(
                        data.name,
                        style: TextStyle(fontSize: 15.0),
                      ),
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
