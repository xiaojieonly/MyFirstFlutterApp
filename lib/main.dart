import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/text/list_text.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'personal song',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'what\'s you say?'
          ),
        ),
        // body: new ListText(),
        body: new MyHomeContent(),
      ),
    );
  }
}

class MyHomeContent extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(

      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return ListText();
          }));
        },
        child: new Container(
          child: new Text(
            "套娃,123456789,,,换行换行换行。自动换行~最大行数3，超过时使用...表示~~~~~测试和数据健康的回复",
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: new TextStyle(
                fontSize: 20,
                color: Colors.deepOrange,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                decorationColor: Colors.deepPurple
            ),
          ),
          height: 300.0,
          width: 300.0,
          decoration: new BoxDecoration(
              color: Colors.cyanAccent,
              border: new Border.all(
                  color: Colors.black,
                  width: 10
              )
          ),
        ),
      ),
    );
  }

}


