import 'package:flutter_app/Classes/user_data.dart';

class ManageUsersModel {
  List<UserData> user = new List<UserData>();

  ManageUsersModel() {
    user = [
      UserData(
          name: "Dhaval",
          institute: "LJ MCA",
          url: "",
          limit: 200,
          used: 50,
          bal: 150,
          isBocked: false),
      UserData(
          name: "Kanti",
          institute: "LJ MBA",
          url: "",
          limit: 200,
          used: 50,
          bal: 150,
          isBocked: true),
      UserData(
          name: "Devang",
          institute: "LJ Engg.",
          url: "",
          limit: 200,
          used: 50,
          bal: 150,
          isBocked: false),
      UserData(
          name: "Nilesh",
          institute: "LJ Art.",
          url: "",
          limit: 200,
          used: 50,
          bal: 150,
          isBocked: false),
      UserData(
          name: "Jayesh",
          institute: "LJ MCA",
          url: "",
          limit: 200,
          used: 50,
          bal: 150,
          isBocked: false),
      UserData(
          name: "Chirag",
          institute: "LJ B.sc.",
          url: "",
          limit: 200,
          used: 50,
          bal: 150,
          isBocked: true),
      UserData(
          name: "Ravi",
          institute: "LJ MBA",
          url: "",
          limit: 200,
          used: 50,
          bal: 150,
          isBocked: false),
    ];
  }

  List<UserData> getData() {
    return user;
  }

  void addUser(String name, String ins, int limit) {
    user.add(UserData(
        name: name,
        institute: ins,
        limit: limit,
        url: "",
        used: 0,
        bal: 0,
        isBocked: false));
  }
}
