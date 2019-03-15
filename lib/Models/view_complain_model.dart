import 'package:flutter_app/Classes/complain.dart';

class ViewComplainModel {
  List<Complain> complain = List();
  ViewComplainModel() {
    complain = [
      Complain(
          id: 1, uname: "Devarsh", complain: "AC Not working",institute: 'MCA' ,roomNO: "101"),
      Complain(id: 2, uname: "Nilesh", complain: "Module Problem",institute: 'MCA', roomNO: "103"),
      Complain(
          id: 3, uname: "Dhaval", complain: "Card not working",institute: 'MCA', roomNO: "102"),
      Complain(id: 4, uname: "Kanti", complain: "AC Not working",institute: 'MCA', roomNO: "106"),
      Complain(id: 5, uname: "Kirtan", complain: "AC Not working",institute: 'MCA', roomNO: "107"),
      Complain(id: 5, uname: "Kirtan", complain: "AC Not working",institute: 'MCA', roomNO: "107"),
    ];
  }

  List<Complain> getData() {
    return complain;
  }
}
