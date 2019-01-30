import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class LoginModel {
  String _userid, _password;
  LoginModel(this._userid, this._password);

  Future<String> auth() async {

    try{
      FirebaseUser user=await FirebaseAuth.instance.signInWithEmailAndPassword(email: _userid, password: _password);
      //Firestore.instance.collection("/users").where('uid')
      print(user.uid+"\n\n\n"+user.email);
      if(_userid=="dev@mail.com"){
        return "user";
      }
      else if(_userid=="admin@mail.com"){
        return "admin";
      }
      else{
        return "director";
      }
    }
    catch(e){
      print(e.toString());
      return "Invalid";
    }

    


    // if (_userid == 'user' && _password == "password1") {
    //   return 'user';
    // } else if (_userid == 'admin' && _password == "password1") {
    //   return 'admin';
    // } else if (_userid == 'director' && _password == "password1") {
    //   return 'director';
    // } else {
    //   return "invalid";
    // }
  }
}
