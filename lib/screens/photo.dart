import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import './view.dart';

class Photo extends StatefulWidget {
  @override
  _Photo createState() => _Photo();
}

class _Photo extends State<Photo> {

  File _beforeImage;
  File _afterImage;

  @override
  Widget build(BuildContext context) {

    void getImage(BuildContext context, ImageSource source, String imageType) {
      if(imageType == 'before') {
        Navigator.pop(context);
        ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image) {
           //setState(() {
             _beforeImage = image;
             // });
          // Navigator.pop(context);
          // MaterialPageRoute(builder: (BuildContext context) => Photo());
        });
      }else if(imageType == 'after'){
        Navigator.pop(context);
         ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image) {
          // setState(() {
            _afterImage = image;
          // });
          // Navigator.pop(context);
          // MaterialPageRoute(builder: (BuildContext context) => Photo());
        });
      }
      // setState(() {});
    }

    void openImagePicker(BuildContext context, String imgType) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 150,
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Pick an Image',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text('Use Camera'),
                    onPressed: () {
                      getImage(context, ImageSource.camera, imgType);
                    },
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text('Use Gallery'),
                    onPressed: () {
                      getImage(context, ImageSource.gallery, imgType);
                    },
                  )
                ],
              ),
            );
          });
    }


    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
          padding: new EdgeInsets.symmetric(vertical: 30.0),
          child: Center(
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Select Before Image',
                      style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Before Image");
                        openImagePicker(context, 'before');
                      },
                      child: _beforeImage == null
                          ? Image.asset('assets/image.png', width: 200,)
                          : Image.file(_beforeImage, fit: BoxFit.cover, width: 300.0, alignment: Alignment.topCenter,),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Select After Image',
                      style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("After Image");
                        openImagePicker(context, 'after');
                      },
                      child: _beforeImage == null
                          ? Image.asset('assets/image.png', width: 200,)
                          : Image.file(_afterImage, fit: BoxFit.cover, width: 300.0, alignment: Alignment.topCenter,),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => View()),
                        );
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: new BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.blue,
                              Colors.lightBlueAccent
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          'NEXT',
                          style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
