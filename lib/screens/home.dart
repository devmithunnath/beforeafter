import 'package:flutter/material.dart';
import './photo.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
            child: Text(
          'BEFORE / AFTER',
          style: new TextStyle(
            fontSize: 20.0,
            color: Colors.blue,
          ),
        )),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: new Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Photo()),
              );
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Colors.blue, Colors.lightBlueAccent],
                ),
              ),
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'CREATE ALBUM',
                style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
