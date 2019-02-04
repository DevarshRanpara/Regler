import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/building.dart';

class BuildingTile extends StatelessWidget {

  final Building data;

  BuildingTile(this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
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