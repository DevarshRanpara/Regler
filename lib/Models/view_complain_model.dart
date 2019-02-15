import 'package:flutter_app/Classes/complain.dart';

class ViewComplainModel {
  List<Complain> complain = List();
  ViewComplainModel() {
    complain = [
      Complain(
          id: 1, uname: "Devarsh", complain: "AC Not working", acNo: "101"),
      Complain(id: 2, uname: "Nilesh", complain: "Module Problem", acNo: "103"),
      Complain(
          id: 3, uname: "Dhaval", complain: "Card not working", acNo: "102"),
      Complain(id: 4, uname: "Kanti", complain: "AC Not working", acNo: "106"),
      Complain(id: 5, uname: "Kirtan", complain: "AC Not working", acNo: "107"),
      Complain(id: 5, uname: "Kirtan", complain: "AC Not working", acNo: "107"),
    ];
  }

  List<Complain> getData() {
    return complain;
  }
}
