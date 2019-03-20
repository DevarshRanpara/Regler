import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetImage {
  BuildContext buildContext;
  File _image;
  GetImage(this.buildContext);
  showDialouge() {
    showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select Image from'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RawMaterialButton(
                  child: Text(
                    'Camera',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(buildContext);
                    getImage('cam');
                  },
                ),
                RawMaterialButton(
                  child: Text(
                    'Gallary',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(buildContext);
                    getImage('gallary');
                  },
                ),
              ],
            ),
          );
        });
  }

  Future<void> getImage(String from) async {
    if (from == 'cam') {
      _image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      _image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
  }
  File getFile(){
    return _image;
  }
}
