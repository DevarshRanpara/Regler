import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Classes/user_usage.dart';

import 'package:flutter_app/Classes/admin_navigation.dart';

class UserHomeModel {
  int usage = 0;
  int limit = 300;
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
    for (var i = 0; i < use.length; i++) {
      usage += use[i].use;
    }
    data = UserData(
        name: "Devarsh",
        useData: use,
        limit: limit,
        used: usage,
        bal: limit - usage,
        gotoProfile: gotoProfile,
        gotoUsage: gotoUsage,
        role: "user");

    nevigation = Nevigation(gotoProfile: gotoProfile, gotoUsage: gotoUsage);
  }

  Nevigation getNevigation() {
    return nevigation;
  }

  UserData getData() {
    return data;
  }
}
