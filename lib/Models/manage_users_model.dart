import 'package:flutter_app/Classes/users.dart';

class ManageUsersModel
{
  List<Users> user=new List<Users>();

  ManageUsersModel()
  {
    user=[
      Users(name:"Dhaval",institute: "LJ MCA",url:"", limit: 200,usage: 50,bal: 150),
      Users(name:"Kanti",institute: "LJ MBA",url:"", limit: 200,usage: 50,bal: 150),
      Users(name:"Devang",institute: "LJ Engg.",url:"", limit: 200,usage: 50,bal: 150),
      Users(name:"Nilesh",institute: "LJ Art.",url:"", limit: 200,usage: 50,bal: 150),
      Users(name:"Jayesh",institute: "LJ Com.",url:"", limit: 200,usage: 50,bal: 150),
      Users(name:"Chirag",institute: "LJ B.sc.",url:"", limit: 200,usage: 50,bal: 150),
      Users(name:"Ravi",institute: "LJ MBA",url:"", limit: 200,usage: 50,bal: 150),
    ];
  }

  List<Users> getData()
  {
    return user;
  }

  void addUser(String name,String ins,int limit)
  {
    user.add(Users(
      name: name,
      institute: ins,
      limit: limit,
      isBocked: false
    ));
  }
  
}