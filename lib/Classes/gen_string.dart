import 'package:flutter_app/Classes/preferances.dart';
import 'package:flutter_app/Classes/url_link.dart';

class GenerateString {
  static String genStringLogin(String method, String uname, String pass) {
    return UrlLink.url +
        '?method=' +
        method +
        '&uname=' +
        uname +
        '&pass=' +
        pass;
  }

  static genStringChpass(String oldpass, String newpass) {
    return UrlLink.url +
        '?method=chpass&uid=' +
        Preferances.id.toString() +
        '&oldpass=' +
        oldpass +
        '&newpass=' +
        newpass;
  }

  static String genStringBlock(String id) {
    return UrlLink.url + '?method=block&id=' + id;
  }

  static String genStringMngUsers() {
    return UrlLink.url + '?method=mngusers&id=' + Preferances.id.toString();
  }

  static String genStringDelete(String id) {
    return UrlLink.url + '?method=deleteuser&id=' + id;
  }
}
