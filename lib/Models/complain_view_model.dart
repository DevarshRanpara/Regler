import 'package:flutter_app/Classes/gen_string.dart';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:http/http.dart' as http;

class AddComplainModel{
  addComplain(String rid,String complain){
    String url = GenerateString.genStringAddComplain(Preferances.id.toString(), rid, complain);
    http.get(Uri.encodeFull(url));
  }
}