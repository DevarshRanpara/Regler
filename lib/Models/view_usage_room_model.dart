import 'package:flutter_app/Classes/user_usage.dart';

class ViewUsageRoomModel
{
  List<UserUsage> usage = List<UserUsage>();
  ViewUsageRoomModel()
  {
    _setData();
  }

  _setData(){
    usage=[
      UserUsage(
        id:1,
        uname: 'Devarsh',
        imgurl: 'https://devicemanagament.000webhostapp.com/userimages/defult.png',
        institute: 'LJMCA',
        room: 'MCA01',
        date: '10/11/13',
        startingTime: '1:1:1',
        endingTime: '1,1,1',
        temp: '10',
        hum: '10',
        use: 100
      ),
            UserUsage(
        id:1,
        uname: 'Devarsh',
        imgurl: 'https://devicemanagament.000webhostapp.com/userimages/defult.png',
        institute: 'LJMCA',
        room: 'MCA01',
        date: '10/11/13',
        startingTime: '1:1:1',
        endingTime: '1,1,1',
        temp: '10',
        hum: '10',
        use: 100
      ),
            UserUsage(
        id:1,
        uname: 'Devarsh',
        imgurl: 'https://devicemanagament.000webhostapp.com/userimages/defult.png',
        institute: 'LJMCA',
        room: 'MCA01',
        date: '10/11/13',
        startingTime: '1:1:1',
        endingTime: '1,1,1',
        temp: '10',
        hum: '10',
        use: 100
      ),
            UserUsage(
        id:1,
        uname: 'Devarsh',
        imgurl: 'https://devicemanagament.000webhostapp.com/userimages/defult.png',
        institute: 'LJMCA',
        room: 'MCA01',
        date: '10/11/13',
        startingTime: '1:1:1',
        endingTime: '1,1,1',
        temp: '10',
        hum: '10',
        use: 100
      ),
            UserUsage(
        id:1,
        uname: 'Devarsh',
        imgurl: 'https://devicemanagament.000webhostapp.com/userimages/defult.png',
        institute: 'LJMCA',
        room: 'MCA01',
        date: '10/11/13',
        startingTime: '1:1:1',
        endingTime: '1,1,1',
        temp: '10',
        hum: '10',
        use: 100
      ),
    ];
  }

  List<UserUsage> getData(){
    return usage;
  }
}