import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/functions.dart';
import 'package:flutter_app/Classes/institute.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Admin/dialouges_institute.dart';
import 'package:flutter_app/CustomWidgets/Admin/manage_institute_tile.dart';
import 'package:flutter_app/CustomWidgets/Common/loading_animation.dart';
import 'package:flutter_app/Models/manage_institute_model.dart';
import 'package:flutter_app/Views/Admin/ManageInstitute/add_institute.dart';

class ManageBuildingView extends StatefulWidget {
  @override
  _ManageBuildingViewState createState() => _ManageBuildingViewState();
}

class _ManageBuildingViewState extends State<ManageBuildingView> {
  ManageInstituteModel model = ManageInstituteModel();

  ManageFunctions functions;
  DialogsIns dialogs;

  @override
  void initState() {
    functions = ManageFunctions(
        change: changeDirector, block: blockInstitute, delete: deleteInstitute);
    dialogs = DialogsIns(context);
    super.initState();
  }

  changeDirector(Institute ins) {
    dialogs.showAlertInstituteChDir(ins);
  }

  blockInstitute(Institute ins) {
    dialogs.showAlertInstituteBlock(ins);
  }

  deleteInstitute(Institute ins) {
    dialogs.showAlertInstituteDelete(ins);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: model.getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return LoadingAnimationCls();
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length + 1,
            itemBuilder: (BuildContext conext, int i) {
              if (i == 0) {
                return _getUpperUI();
              }
              return ManageinstituteTile(snapshot.data[i - 1], functions);
            },
          );
        }
      },
    ));
  }

  _getUpperUI() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
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
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
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
                        Strings.manageInstitutes,
                        style: TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                ),
              ))),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddInstituteView()));
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
                        Strings.btnAddInstitute,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
