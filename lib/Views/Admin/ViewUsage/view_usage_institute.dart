import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Admin/institute_tile.dart';
import 'package:flutter_app/CustomWidgets/Common/loading_animation.dart';
import 'package:flutter_app/Models/view_usage_institute_model.dart';

class ViewUsageInstitute extends StatefulWidget {
  final Function gotoRoom;

  ViewUsageInstitute(this.gotoRoom);
  @override
  _ViewUsageInstituteState createState() => _ViewUsageInstituteState();
}

class _ViewUsageInstituteState extends State<ViewUsageInstitute> {
  ViewUsageInstituteModel model = ViewUsageInstituteModel();
  // List<InstituteTile> instituteTile = List();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: model.getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return LoadingAnimationCls();
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length + 1,
            itemBuilder: (BuildContext conext, int i) {
              if (i == 0) {
                return getUpperUI();
              }
              return InstituteTile(snapshot.data[i - 1], widget.gotoRoom);
            },
          );
        }
      },
    );
  }

  getUpperUI() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
        ),
        InkWell(
            onTap: () {},
            child: Card(
                child: Container(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
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
              ),
            ))),
      ],
    );
  }
}
