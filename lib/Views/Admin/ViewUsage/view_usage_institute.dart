import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/institute.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Admin/institute_tile.dart';
import 'package:flutter_app/Models/view_usage_institute_model.dart';

class ViewUsageInstitute extends StatefulWidget {
  final Function gotoRoom;

  ViewUsageInstitute(this.gotoRoom);
  @override
  _ViewUsageInstituteState createState() => _ViewUsageInstituteState();
}

class _ViewUsageInstituteState extends State<ViewUsageInstitute> {
  ViewUsageInstituteModel model = ViewUsageInstituteModel();
  List<Institute> institutes = List();
  List<InstituteTile> instituteTile = List();

  @override
  void initState() {
    institutes = model.getData();

    for (int i = 0; i < institutes.length; i++) {
      instituteTile.add(InstituteTile(institutes[i], widget.gotoRoom));
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
                    Strings.viewInstituteUsage,
                    style: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ))),
        Column(
          children: instituteTile,
        )
      ],
    );
  }
}
