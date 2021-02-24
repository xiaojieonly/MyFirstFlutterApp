

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'hello flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to flutter'),
        ),
        body: new Center(
          child: new Text('Hello world'),
        ),
      ),
    );
  }
}
