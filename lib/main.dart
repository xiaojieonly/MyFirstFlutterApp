import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
      return new MaterialApp(
        title: 'Flutter Demo2',
        theme: new ThemeData(
          primaryColor: Colors.blueAccent
        ),
        home: new MyHomePage(title:'Demo Page One'),
      );
  }
}


class MyHomePage extends StatefulWidget{
  final String title;
  MyHomePage({Key key,this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>{
  int _counter = 0;
  
  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('你点了按钮的次数：'),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '增加',
        child: new Icon(Icons.add),
      ),
    );
  }
}


