import 'package:flutter/material.dart';
import 'package:flutter_app/CustomWidgets/Admin/manage_building_tile.dart';
import 'package:flutter_app/Classes/building.dart';
import 'package:flutter_app/Models/manage_building_model.dart';
import 'package:flutter_app/Views/Admin/ManageBuilding/add_building.dart';

class ManageBuildingView extends StatefulWidget {
  @override
  _ManageBuildingViewState createState() => _ManageBuildingViewState();
}

class _ManageBuildingViewState extends State<ManageBuildingView> {
  ManageBuildingModel model = ManageBuildingModel();

  List<Widget> buildingTile = List();

  List<Building> buildings;

  @override
  void initState() {
    buildings = model.getData();
    for (int i = 0; i < buildings.length; i++) {
      buildingTile.add(ManageBuildingTile(buildings[i]));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Montserrat',
            accentColor: Colors.teal),
        home: Scaffold(
          body: ListView(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
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
                          "Manage Buildings",
                          style: TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  ))),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AddBuildingView()));
                  },
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "Add Building",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )),
              Column(children: buildingTile)
            ],
          ),
        ));
  }
}
