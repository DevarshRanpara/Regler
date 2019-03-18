import 'package:flutter_app/Classes/complain.dart';
import 'package:flutter_app/Classes/gen_string.dart';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewComplainModel {
  

  Future<List<Complain>> getData() async {
    List<Complain> complain = List<Complain>();

    String url = GenerateString.genStringViewComplain(Preferances.id.toString());
    var response = await http.get(
      Uri.encodeFull(url),
    );

    if (response.body.toString() == 'no_data') {
      return complain;
    }

    print(response.body.toString());

    List data = jsonDecode(response.body);

    for (int i = 0; i < data.length; i++) {
      Complain complaindata = Complain(
          id: int.parse(data[i]['id']),
          uname: data[i]['u_name'],
          imgurl: data[i]['image_url'],
          institute: data[i]['name'],
          roomNO: data[i]['room_no'],
          complain: data[i]['complain']
        );
      complain.add(complaindata);
    }

    return complain;
  }
}
