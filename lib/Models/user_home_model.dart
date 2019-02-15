import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Classes/user_usage.dart';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:flutter_app/Classes/admin_navigation.dart';

class UserHomeModel {
  UserData data;
  Function gotoUsage, gotoProfile;
  Nevigation nevigation;

  UserHomeModel(this.gotoProfile, this.gotoUsage) {
    setData();
  }

  void setData() {
    var use = [
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
    ];

    data = UserData(
        name: Preferances.name,
        useData: use,
        limit: int.parse(Preferances.limit),
        used: int.parse(Preferances.use),
        bal: int.parse(Preferances.bal),
        role: Preferances.role);

    nevigation = Nevigation(gotoProfile: gotoProfile, gotoUsage: gotoUsage);
  }

  Nevigation getNevigation() {
    return nevigation;
  }

  UserData getData() {
    return data;
  }
}
