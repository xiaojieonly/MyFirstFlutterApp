import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'auto_character_navigator_list.dart';
import 'property/alphabet_child_style.dart';

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
        alphabetChildStyle: AlphabetChildStyle(
          unSelectBackgroundColor: Colors.deepOrange,
        ),
        childrenNavigator: naList,
        children: chList,
      ),
    );
  }


}
