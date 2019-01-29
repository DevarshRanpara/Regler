import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Classes/user_usage.dart';
class ViewUsageUserModel
{
  List<UserData> data;
  List<UserUsage> usage;

  ViewUsageUserModel()
  {
    usage=[
      UserUsage(date:"29th Jan, 2019",startingTime: "10:00 AM", endingTime: "10:20 AM",use: 20),
      UserUsage(date:"29th Jan, 2019",startingTime: "10:00 AM", endingTime: "10:20 AM",use: 30),
      UserUsage(date:"29th Jan, 2019",startingTime: "10:00 AM", endingTime: "10:20 AM",use: 25),
      UserUsage(date:"29th Jan, 2019",startingTime: "10:00 AM", endingTime: "10:20 AM",use: 10),
      UserUsage(date:"29th Jan, 2019",startingTime: "10:00 AM", endingTime: "10:20 AM",use: 15),
    ];

    data=[
      UserData(name: "Devarsh",institute: "LJ MCA",useData: usage,limit: 120,used: 100,bal: 20),
      UserData(name: "Dhaval",institute: "LJ MBA",useData: usage,limit: 120,used: 100,bal: 20),
      UserData(name: "Kanti",institute: "LJ Eng.",useData: usage,limit: 120,used: 100,bal: 20),
      UserData(name: "Nilesh",institute: "LJ Art",useData: usage,limit: 120,used: 100,bal: 20),
    ];
  }

  List<UserData> getData(){
    return data;
  }  
}