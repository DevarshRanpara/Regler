class LoginModel {
  String _userid, _password;
  LoginModel(this._userid, this._password);

  String auth() {
    if (_userid == 'user' && _password == "password1") {
      return 'user';
    } else if (_userid == 'admin' && _password == "password1") {
      return 'admin';
    } else if (_userid == 'director' && _password == "password1") {
      return 'director';
    } else {
      return "invalid";
    }
  }
}
