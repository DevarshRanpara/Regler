import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/Classes/user_usage.dart';
import 'package:flutter_app/CustomWidgets/Common/loading_animation.dart';
import 'package:flutter_app/CustomWidgets/Common/usage_report_user.dart';
import 'package:flutter_app/Models/view_usage_user_model.dart';

class AdminUseView extends StatefulWidget {

  final String id;
  AdminUseView(this.id);

  @override
  _AdminUseViewState createState() => _AdminUseViewState();
}

class _AdminUseViewState extends State<AdminUseView> {
  Widget chart;

  List<Widget> list = new List();

  ViewUsageUserModel model = ViewUsageUserModel();

  _setChart(List<UserUsage> use) {
    List<Usage> data = new List<Usage>();

    for (int i = 0; i < use.length; i++) {
      data.add(Usage(i, use[i].use));
    }

    var series = [
      charts.Series<Usage, int>(
        id: Strings.usage,
        domainFn: (Usage usage, _) => usage.useTitle,
        measureFn: (Usage usage, _) => usage.useData,
        data: data,
      )
    ];

    chart = charts.LineChart(
      series,
      animate: true,
      defaultRenderer: charts.LineRendererConfig(
        includePoints: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: model.getUsage(widget.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return LoadingAnimationCls();
        } else {
          _setChart(snapshot.data);
          return ListView.builder(
            itemCount: snapshot.data.length + 1,
            itemBuilder: (BuildContext conext, int i) {
              if (i == 0) {
                return __getUpperUI();
              }
              return UserReport(snapshot.data[i - 1]);
            },
          );
        }
      },
    ));
  }

  __getUpperUI() {
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
                        Icons.notifications,
                        color: Colors.redAccent,
                        size: 35.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        Strings.yourUsage,
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
              onTap: () {},
              child: Card(
                  child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: chart,
                    ),
                  ],
                ),
              ))),
          Column(
            children: list,
          )
        ],
      ),
    );
  }
}

class Usage {
  final int useTitle;
  final int useData;

  Usage(this.useTitle, this.useData);
}
