import './user_usage.dart';

class UserData {
  final List<UserUsage> useData;
  final String name;
  final String role;
  final int limit;
  final int bal;
  final int used;
  final Function gotoProfile;
  final Function gotoUsage;
  UserData(
      {this.useData,
      this.name,
      this.limit,
      this.bal,
      this.used,
      this.gotoProfile,
      this.gotoUsage,
      this.role});
}
