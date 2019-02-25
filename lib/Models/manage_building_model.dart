import 'dart:convert';

import 'package:flutter_app/Classes/building.dart';
import 'package:flutter_app/Classes/gen_string.dart';
import 'package:http/http.dart' as http;

class ManageBuildingModel {
  Future<List<Building>> getData() async {
    List<Building> buildings = List<Building>();
    String url = GenerateString.generateStringListIns();
    var response = await http.get(
      Uri.encodeFull(url),
    );
    List data = jsonDecode(response.body);
    for (int i = 0; i < data.length; i++) {
      Building building = Building(
        id: int.parse(data[i]['id']),
        name: data[i]['name'],
        director: data[i]['director'],
      );
      buildings.add(building);
    }
    return buildings;
  }
}
