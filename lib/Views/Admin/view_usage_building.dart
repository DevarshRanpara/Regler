import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/building.dart';
import 'package:flutter_app/CustomWidgets/Admin/building_tile.dart';
import 'package:flutter_app/Models/view_usage_building_model.dart';

class ViewUsageBulding extends StatefulWidget {
  final Function gotoRoom;

  ViewUsageBulding(this.gotoRoom);
  @override
  _ViewUsageBuldingState createState() => _ViewUsageBuldingState();
}

class _ViewUsageBuldingState extends State<ViewUsageBulding> {
  ViewUsageBuldingModel model = ViewUsageBuldingModel();
  List<Building> buildings = List();
  List<BuildingTile> buildingTile = List();

  @override
  void initState() {
    buildings = model.getData();

    for (int i = 0; i < buildings.length; i++) {
      buildingTile.add(BuildingTile(buildings[i], widget.gotoRoom));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
        ),
        InkWell(
            onTap: () {},
            child: Card(
                child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.location_city,
                    color: Colors.redAccent,
                    size: 35.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "View Building Usage",
                    style: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ))),
        Column(
          children: buildingTile,
        )
      ],
    );
  }
}
