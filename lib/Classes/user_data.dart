import './user_usage.dart';

class UserData {
  int id;
  String name;
  String url;
  bool isBocked;
  String institute;
  String role;
  int limit;
  int bal;
  int used;
  List<UserUsage> useData;
  
  UserData(
      {
      this.id,
      this.url,
      this.isBocked,
      this.institute,
      this.useData,
      this.name,
      this.limit,
      this.bal,
      this.used,
      this.role});
}
