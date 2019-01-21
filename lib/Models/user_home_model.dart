import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Classes/user_usage.dart';

class UserHomeModel
{
  int usage=0;
  int limit=300;
  UserData data;
  Function gotoUsage,gotoProfile;

  UserHomeModel(this.gotoProfile,this.gotoUsage){setData();}

  void setData()
  { 
    var use = [
      UserUsage("10th, Jan, 2019", "10:00 AM", "10:20 AM", 20),
      UserUsage("12th, Jan, 2019", "10:00 AM", "10:20 AM", 20),
      UserUsage("13th, Jan, 2019", "10:00 AM", "10:30 AM", 30),
      UserUsage("16th, Jan, 2019", "10:00 AM", "10:50 AM", 50),
    ];
    for (var i = 0; i < use.length; i++) {
      usage += use[i].use;
    }
    data=UserData(name: "Devarsh",useData: use,limit: limit,used: usage,bal:limit-usage,gotoProfile: gotoProfile,
    gotoUsage: gotoUsage
     );
  }

  UserData getData(){
    return data;
  }

}