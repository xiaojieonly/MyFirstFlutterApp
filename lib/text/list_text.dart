import 'package:flutter/material.dart';

import 'auto_character_navigator_list.dart';

class ListText extends StatefulWidget {
  ListText({Key? key}) : super(key: key);

  @override
  _ListTextState createState() => _ListTextState();
}

class _ListTextState extends State<ListText> {

  late List<Widget> children;
  late List<String> childrenNavigator;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoCharacterNavigatorList(
      childrenNavigator: [],
      children: [],
    );
  }


}
