import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Classes/user_usage.dart';

class AdminHomeModel
{
  UserData data;
  int usage=0;
  List<UserUsage> use;
  String name,role;
  AdminHomeModel(this.name,this.role)
  {
    setData();
  }

  void setData()
  {
    use = [
      UserUsage("10th, Jan, 2019", "10:00 AM", "10:20 AM", 20),
      UserUsage("12th, Jan, 2019", "10:00 AM", "10:20 AM", 20),
      UserUsage("13th, Jan, 2019", "10:00 AM", "10:30 AM", 30),
      UserUsage("16th, Jan, 2019", "10:00 AM", "10:50 AM", 50),
      UserUsage("17th, Jan, 2019", "10:00 AM", "10:30 AM", 30),
      UserUsage("18th, Jan, 2019", "10:00 AM", "10:20 AM", 20),
      UserUsage("19th, Jan, 2019", "10:00 AM", "10:10 AM", 10),
      UserUsage("20th, Jan, 2019", "10:00 AM", "10:20 AM", 20),
    ];
    for (var i = 0; i < use.length; i++) {
      usage += use[i].use;
    }
    data=UserData(name: name,role: role,useData: use,used: usage);
  }
  UserData getData(){
    return data;
  }
}