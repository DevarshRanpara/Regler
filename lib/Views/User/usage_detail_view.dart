import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class UsageDetail extends StatefulWidget {
  final int limit = 200;
  final int use;

  UsageDetail(this.use);

  @override
  _UsageDetailState createState() => _UsageDetailState();
}

class _UsageDetailState extends State<UsageDetail> {
  final double sizeBoxSize = 10.0;

  @override
  Widget build(BuildContext context) {
    var data = [
      Usage("Remaining", widget.limit - widget.use, Colors.teal),
      Usage("Used", widget.use, Colors.red),
    ];

    var series = [
      charts.Series(
          domainFn: (Usage usage, _) => usage.useTitle,
          measureFn: (Usage usage, _) => usage.useData,
          colorFn: (Usage usage, _) => usage.color,
          id: "Usage",
          data: data)
    ];

    var chart = charts.PieChart(
      series,
      defaultRenderer: charts.ArcRendererConfig(arcWidth: 30),
    );

    return Scaffold(
        body: Container(
            margin: EdgeInsets.all(8.0),
            child: ListView(children: <Widget>[
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
                          "Usage Report",
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
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: chart,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: sizeBoxSize,
                                  height: sizeBoxSize,
                                  child: const DecoratedBox(
                                    decoration:
                                        const BoxDecoration(color: Colors.teal),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  "Remaining",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: sizeBoxSize,
                                  height: sizeBoxSize,
                                  child: const DecoratedBox(
                                    decoration:
                                        const BoxDecoration(color: Colors.red),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  "Used",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ))),
              InkWell(
                  onTap: () {},
                  child: Card(
                      child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Limit",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              "Usage",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              "Remining",
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.limit.toString() + " Minutes",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              widget.use.toString() + " Minutes",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              (widget.limit - widget.use).toString() +
                                  " Minutes",
                              style: TextStyle(
                                color: Colors.tealAccent,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))),
            ])));
  }
}

class Usage {
  final String useTitle;
  final int useData;

  final charts.Color color;

  Usage(this.useTitle, this.useData, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
