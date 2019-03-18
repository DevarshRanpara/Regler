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

  static genStringBlockIns(String id) {
    return UrlLink.url + '?method=blockInstitute&insid=' + id;
  }

  static generateStringAddUser(String username, String ins, String limit) {
    return UrlLink.url +
        '?method=addUser&uname=' +
        username +
        '&ins=' +
        ins +
        '&limit=' +
        limit;
  }

  static generateStringListIns() {
    return UrlLink.url + '?method=listInstitute';
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

  static String genStringChLimit(String id, String limit) {
    return UrlLink.url + '?method=changeLimit&id=' + id + '&limit=' + limit;
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

  static String genStringGetRooms(int id) {
    return UrlLink.url + '?method=listrooms&id=' + id.toString();
  }

  static String genStringBlockRoom(String id) {
    return UrlLink.url + '?method=blockroom&id=' + id;
  }
  static String genStringAddRoom(String roomName,String id) {
    return UrlLink.url + '?method=addroom&roomno='+roomName+'&insid='+id;
  }

  static String genStringViewUsageRoom(String roomid) {
    return UrlLink.url + '?method=viewUsageRoom&roomid='+roomid;
  }

  static String genStringViewUsageUser(String userid) {
    return UrlLink.url + '?method=viewUsageUser&userid='+userid;
  }

  static String genStringViewComplain(String userid) {
    return UrlLink.url + '?method=viewcomplain&id='+userid;
  }
  
  static String genStringDeleteRoom(String roomid) {
    return UrlLink.url + '?method=deleteRoom&roomid='+roomid;
  }
}
