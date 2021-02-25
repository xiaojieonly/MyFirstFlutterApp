import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(color, Icons.call, 'CALL'),
          buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );


    return new MaterialApp(
      title: 'hello flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to flutter'),
        ),
        // body: new Center(
        //   child: new Text('Hello world'),
        // ),
        body: new Column(
          children: [
            titleSection,
            buttonSection
          ],
        ),
      ),
    );
  }


  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    bottom: 8
                  ),
                  child: Text(
                    '野外露营地',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Text(
                  '犄角旮旯里',
                  style: TextStyle(
                    color: Colors.grey[500]
                  ),
                )
              ],
            )
        ),
        Icon(
          Icons.star,
          color: Colors.blueAccent[500],
        ),
        Text('41')
      ],
    ),
  );





  //按钮生成函数
  static Column buildButtonColumn(Color Tcolor,IconData iconData,String labelString){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData,color: Tcolor),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            labelString,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Tcolor,
            ),
          ),
        )
      ],
    );
  }
}

