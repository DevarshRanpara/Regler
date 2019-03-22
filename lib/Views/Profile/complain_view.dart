import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/preferances.dart';
import 'package:flutter_app/Classes/room.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Common/expantion_tile.dart';
import 'package:flutter_app/Models/complain_view_model.dart';

class Complain extends StatefulWidget {
  @override
  _ComplainState createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {
  String expantitle = Strings.selectRoom;
  final GlobalKey<AppExpansionTileState> expansionTile = new GlobalKey();
  AddComplainModel model = AddComplainModel();
  List<Widget> listTles = List<Widget>();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String complain;
  int rid = -1;
  Widget mainUI;

  @override
  void initState() {
    int n = Preferances.rooms.length;

    for (int i = 0; i < n; i++) {
      _genListTiles(Preferances.rooms[i]);
    }
    super.initState();
  }

  _genListTiles(Room room) {
    listTles.add(ListTile(
      title: Text(room.name),
      onTap: () {
        setState(() {
          this.expantitle = room.name;
          rid = room.id;
          expansionTile.currentState.collapse();
        });
      },
    ));
  }

  _submit()
  {
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      if(rid==-1){
        showSnakbar("Please select room");
      }
      else{
        model.addComplain(rid.toString(), complain);
      }
    }
  }

    showSnakbar(String msg) {
    final snackbar = new SnackBar(
      content: new Text(msg),
      backgroundColor: Colors.red,
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
          margin: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                    onTap: () {},
                    child: Card(
                        child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.error,
                            color: Colors.redAccent,
                            size: 35.0,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            Strings.complain,
                            style: TextStyle(
                                color: Colors.tealAccent,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ))),
              ),
              InkWell(
                  onTap: () {},
                  child: Card(
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 2.0),
                          child: AppExpansionTile(
                              key: expansionTile,
                              title: Text(expantitle),
                              children: listTles)))),
              InkWell(
                  onTap: () {},
                  child: Card(
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 5.0),
                          child: Form(
                            key: formKey,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: Strings.enterDetails),

                                validator: (val){
                                  if(val.length==0)
                                  {
                                    return 'Enter complain';
                                  }
                                  else if(val.length>50){
                                    return 'Max lenght is 50';
                                  }
                                  else{
                                    return null;
                                  }
                                },
                                onSaved: (val) => complain = val,
                            ),
                          )))),
              Center(
                child: RaisedButton(
                  color: Colors.teal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.check),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        Strings.btnSubmit,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _submit();
                  },
                  splashColor: Colors.tealAccent,
                ),
              ),
            ],
          )),
    );
  }
}
