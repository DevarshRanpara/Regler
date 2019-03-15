import 'package:flutter_app/Classes/gen_string.dart';
import 'package:flutter_app/Classes/user_usage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewUsageRoomModel
{
  Future<List<UserUsage>> getUsage(String id) async {
    List<UserUsage> useData = List<UserUsage>();

    String url = GenerateString.genStringViewUsageRoom(id);
    var response = await http.get(
      Uri.encodeFull(url),
    );

    if (response.body.toString() == 'no_data') {
      return useData;
    }

    print(response.body.toString());

    List data = jsonDecode(response.body);

    for (int i = 0; i < data.length; i++) {
      UserUsage usage = UserUsage(
          id: int.parse(data[i]['id']),
          uname: data[i]['u_name'],
          imgurl: data[i]['image_url'],
          institute: data[i]['name'],
          room: data[i]['room_no'],
          date: data[i]['reading_date'],
          startingTime: data[i]['start_time'],
          endingTime: data[i]['stop_time'],
          temp: data[i]['temperature'],
          hum: data[i]['humidity'],
          use: int.parse(data[i]['usage_time']));
      useData.add(usage);
    }

    return useData;
  }
}