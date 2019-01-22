import 'package:flutter_app/Classes/admin_data.dart';

class AdminHomeModel
{
  AdminData data;
  AdminHomeModel(String name,String role)
  {
    data=AdminData(name: name,role: role);
  }
}