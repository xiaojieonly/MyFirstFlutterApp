import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easy_navigation_list/flutter_easy_navigation_list.dart';




class ListText extends StatefulWidget {
  ListText({Key? key}) : super(key: key);

  @override
  _ListTextState createState() => _ListTextState();
}

class _ListTextState extends State<ListText> {

  late List<String> naList = [];
  late List<Widget> chList = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 27; i++) {
      naList.add(i == 26
          ? String.fromCharCode(35)
          : String.fromCharCode(i + 65));
      int num = Random().nextInt(10) + 3;
      List<Widget> cChList = [];
      for (int j = 0; j < num; j++) {
        cChList.add(
          Container(
            width: window.physicalSize.width,
            height: 50,
            alignment: Alignment.centerLeft,
            child: Text(
              naList[i] + ':' + j.toString(),
            ),
          ),
        );
      }
      chList.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: cChList,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      color: Colors.blue,
      child: AutoCharacterNavigatorList(
        // alphabetDirection: Axis.horizontal,
        alphabetChildrenPosition: Position(
          left: 16,
          top: 30,
        ),
        alphabetChildStyle: AlphabetChildrenStyle(
          unSelectBackgroundColor: Colors.deepOrange,
          margin: EdgeInsets.zero,
          totalWidth: 375,
          totalHeight: 16,
          alphabetDirection: Axis.horizontal,
        ),
        childrenNavigator: naList,
        children: chList,
      ),
    );
  }


}
