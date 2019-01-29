import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Classes/user_usage.dart';

class AdminHomeModel {
  UserData data;
  int usage = 0;
  List<UserUsage> use;
  String name, role;
  AdminHomeModel(this.name, this.role) {
    setData();
  }

  void setData() {
    use = [
      UserUsage(
          date: "10th, Jan, 2019",
          startingTime: "10:00 AM",
          endingTime: "10:20 AM",
          use: 20),
      UserUsage(
          date: "12th, Jan, 2019",
          startingTime: "10:00 AM",
          endingTime: "10:20 AM",
          use: 20),
      UserUsage(
          date: "13th, Jan, 2019",
          startingTime: "10:00 AM",
          endingTime: "10:30 AM",
          use: 30),
      UserUsage(
          date: "16th, Jan, 2019",
          startingTime: "10:00 AM",
          endingTime: "10:50 AM",
          use: 50),
      UserUsage(
          date: "17th, Jan, 2019",
          startingTime: "10:00 AM",
          endingTime: "10:30 AM",
          use: 30),
      UserUsage(
          date: "18th, Jan, 2019",
          startingTime: "10:00 AM",
          endingTime: "10:20 AM",
          use: 20),
      UserUsage(
          date: "19th, Jan, 2019",
          startingTime: "10:00 AM",
          endingTime: "10:10 AM",
          use: 10),
      UserUsage(
          date: "20th, Jan, 2019",
          startingTime: "10:00 AM",
          endingTime: "10:20 AM",
          use: 20),
      UserUsage(
          date: "20th, Jan, 2019",
          startingTime: "10:00 AM",
          endingTime: "10:20 AM",
          use: 30),
    ];
    for (var i = 0; i < use.length; i++) {
      usage += use[i].use;
    }
    data = UserData(name: name, role: role, useData: use, used: usage);
  }

  UserData getData() {
    return data;
  }
}
