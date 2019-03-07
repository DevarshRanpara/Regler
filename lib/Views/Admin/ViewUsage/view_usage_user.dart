import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Admin/user_tile.dart';
import 'package:flutter_app/CustomWidgets/Common/loading_animation.dart';
import 'package:flutter_app/Models/view_usage_user_model.dart';

class ViewUsageUser extends StatefulWidget {
  final Function gotoUsage;
  ViewUsageUser(this.gotoUsage);
  @override
  _ViewUsageUserState createState() => _ViewUsageUserState();
}

class _ViewUsageUserState extends State<ViewUsageUser> {
  ViewUsageUserModel model = ViewUsageUserModel();

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
              return UserTile(snapshot.data[i-1],widget.gotoUsage);
            },
          );
        }
      },
    );
  }

  getUpperUI() {
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
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(
                        Icons.supervisor_account,
                        color: Colors.redAccent,
                        size: 35.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        Strings.viewUserUsage,
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
      ),
    );
  }
}
