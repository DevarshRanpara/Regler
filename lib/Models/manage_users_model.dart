import 'package:flutter_app/Classes/users.dart';

class ManageUsersModel
{
  List<Users> user=new List<Users>();

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