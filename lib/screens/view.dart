import 'package:flutter/material.dart';
import './view.dart';

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Center(
                  child: Text('Before/After Image',
                    style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print("Clicked to upload the Before Image");
                        },
                        child: Image.asset(
                          'assets/image.png',
                          width: 150,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Clicked to upload the After Image");
                        },
                        child: Image.asset(
                          'assets/image.png',
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
