import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Models/manage_users_model.dart';

class UserRepository {
  final manageUsers = ManageUsersModel();

  Future<List<UserData>> fetchAllUsers() => manageUsers.getData();
}
