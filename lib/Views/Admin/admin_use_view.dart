import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_app/Classes/user_usage.dart';
import 'package:flutter_app/CustomWidgets/Common/usage_report_user.dart';

class AdminUseView extends StatefulWidget {
  final List<UserUsage> use;

  AdminUseView(this.use);

  @override
  _AdminUseViewState createState() => _AdminUseViewState();
}

class _AdminUseViewState extends State<AdminUseView> {
  List<Widget> list = new List();

  @override
  void initState() {
    for (int i = 0; i < widget.use.length; i++) {
      _addItem(widget.use[i]);
    }

    super.initState();
  }

  void _addItem(UserUsage data) {
    setState(() {
      list.add(UserReport(data));
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Usage> data = new List<Usage>();

    for (int i = 0; i <= 6; i++) {
      data.add(Usage(i, widget.use[i].use));
    }

    var series = [
      charts.Series<Usage, int>(
        id: "Usage",
        domainFn: (Usage usage, _) => usage.useTitle,
        measureFn: (Usage usage, _) => usage.useData,
        data: data,
      )
    ];

    var chart = charts.LineChart(
      series,
      animate: true,
      defaultRenderer: charts.LineRendererConfig(
        includePoints: true,
      ),
    );

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
                        Icons.notifications,
                        color: Colors.redAccent,
                        size: 35.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Your Usage",
                        style: TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w200),
                      )
                    ],
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
                      Text("Your use of last seven days"),
                    ],
                  ),
                ))),
            Column(
              children: list,
            )
          ],
        )));
  }
}

class Usage {
  final int useTitle;
  final int useData;

  Usage(this.useTitle, this.useData);
}
