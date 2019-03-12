import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/Resources/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final _repositary = UserRepository();
  final _userFetcher = PublishSubject<List<UserData>>();

  Observable<List<UserData>> get allUsers => _userFetcher.stream;

  void fetchAllUsers() async {
    List<UserData> userData = await _repositary.fetchAllUsers();
    _userFetcher.sink.add(userData);
  }

  dispose() {
    _userFetcher.close();
  }
}

