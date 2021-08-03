import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/text/property/alphabet_child_style.dart';
import 'property/position.dart';

///  一个使用极为简单的字母导航栏
///  A very simple alphabet navigation bar
///
class AutoCharacterNavigatorList extends StatefulWidget {
  /// 这是需要导航的内容
  /// 出于安全性及健壮性考虑：[children]的长度需要与[childrenNavigator]的长度一致
  /// This is contents what needs to be navigated
  /// For safety and robustness: the length of [children] needs to be the same
  /// as the length of [childrenNavigator]
  ///
  /// 这是必需的内容
  /// This is required content
  final List<Widget> children;

  /// 这是导航所使用的字符
  /// 出于安全性及健壮性考虑：[childrenNavigator]的长度需要与[children]的长度一致
  /// This is the character used for navigation
  /// For safety and robustness: the length of [childrenNavigator] needs to be the same
  /// as the length of [children]
  ///
  /// 这是必需的内容
  /// This is required content
  final List<String> childrenNavigator;

  final AlphabetChildrenStyle? alphabetChildStyle;

  /// 这是非必填的属性
  /// 默认位置为组件右侧
  /// 定义导航组件的堆叠位置
  ///
  /// This is an optional attribute
  /// The default position is the right side of the component
  /// Define the stacking position of navigation components
  final Position? alphabetChildrenPosition;

  AutoCharacterNavigatorList({
    Key? key,
    required this.children,
    required this.childrenNavigator,
    this.alphabetChildStyle,
    this.alphabetChildrenPosition,
  })  : assert(children.length == childrenNavigator.length),
        super(key: key);

  @override
  _AutoCharacterNavigatorListState createState() =>
      _AutoCharacterNavigatorListState();
}

class _AutoCharacterNavigatorListState
    extends State<AutoCharacterNavigatorList> {
  late List<double> _jumpPosition;
  List<GlobalKey<_ChildState>> _childKeys = [];
  List<Widget> _children = [];
  ScrollController _scrollController = new ScrollController();

  List<GlobalKey<_AlphabetItemState>> _alphabetKeys = [];
  List<Widget> _alphabetChildren = [];
  int _selectIndex = 0;
  int _loadNum = 0;

  bool _running = false;

  late AlphabetChildrenStyle _alphabetChildStyle;

  @override
  void initState() {
    super.initState();
    _alphabetChildStyle = widget.alphabetChildStyle ?? AlphabetChildrenStyle();
    _jumpPosition = List.filled(widget.children.length, 0, growable: false);
    _initJump();
    _initAlphabet();

    _scrollController.addListener(() {
      if (!_running) {
        _listChange(_scrollController.offset);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _bodyBuild();
  }

  Widget _bodyBuild() {
    return _switchFormPaste();
    // if (widget.placeStyle == PlaceStyle.paste) {
    //
    // } else {
    //   return _switchFormIntrude();
    // }
  }

  Widget _switchFormPaste() {
    Position position;
    if (widget.alphabetChildrenPosition == null) {
      position = Position(right: 16, top: 20);
    } else {
      position = widget.alphabetChildrenPosition!;
    }

    if (_alphabetChildStyle.alphabetDirection == Axis.vertical) {
      return Stack(
        children: [
          ListView(
            controller: _scrollController,
            children: _children,
          ),
          Positioned(
            left: position.left,
            top: position.top,
            right: position.right,
            bottom: position.bottom,
            width: position.width,
            height: position.height,
            child: Container(
              width: _alphabetChildStyle.totalWidth,
              height: _alphabetChildStyle.totalHeight,
              color: _alphabetChildStyle.childrenBackgroundColor,
              // height: 540,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _alphabetChildren,
                ),
              ),
            ),
          )
        ],
      );
    } else {
      return Stack(
        children: [
          ListView(
            controller: _scrollController,
            children: _children,
          ),
          Positioned(
            left: position.left,
            top: position.top,
            right: position.right,
            bottom: position.bottom,
            width: position.width,
            height: position.height,
            child: Container(
              width: _alphabetChildStyle.totalWidth,
              height: _alphabetChildStyle.totalHeight,
              color: _alphabetChildStyle.childrenBackgroundColor,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _alphabetChildren,
                ),
              ),
            ),
          )
        ],
      );
    }
  }

  /// 侵入式布局有较为严重的bug
  /// 主要是我太菜了。
  ///
  /// Intrusive layout has more serious bugs
  /// Mainly because I am too food.
  @deprecated
  Widget _switchFormIntrude() {
    // Position position;
    // if (widget.alphabetPosition == null) {
    //   position = Position(right: 16, top: 20);
    // } else {
    //   position = widget.alphabetPosition!;
    // }

    // if (widget.alphabetDirection == Axis.vertical) {
    //   if (widget.place == Place.right) {
    //     return Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         ListView(
    //           controller: _scrollController,
    //           children: _children,
    //         ),
    //         Container(
    //           width: _alphabetChildStyle.width,
    //           // height: 540,
    //           child: SingleChildScrollView(
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               children: _alphabetChildren,
    //             ),
    //           ),
    //         ),
    //       ],
    //     );
    //   } else {
    //     return Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Container(
    //           width: _alphabetChildStyle.width,
    //           // height: 540,
    //           child: SingleChildScrollView(
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               children: _alphabetChildren,
    //             ),
    //           ),
    //         ),
    //         ListView(
    //           controller: _scrollController,
    //           children: _children,
    //         ),
    //       ],
    //     );
    //   }
    // } else {
    //   if (widget.place == Place.top) {
    //     return Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Container(
    //           height: _alphabetChildStyle.height,
    //           // height: 540,
    //           child: SingleChildScrollView(
    //             scrollDirection: Axis.horizontal,
    //             child: Row(
    //               mainAxisSize: MainAxisSize.min,
    //               children: _alphabetChildren,
    //             ),
    //           ),
    //         ),
    //         Container(
    //           // height: window.physicalSize.height-_alphabetChildStyle.height,
    //           child: ListView(
    //             controller: _scrollController,
    //             children: _children,
    //           ),
    //         ),
    //
    //       ],
    //     );
    //   }else{
    //     return Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Container(
    //           // height: window.physicalSize.height-_alphabetChildStyle.height,
    //           child: ListView(
    //             controller: _scrollController,
    //             children: _children,
    //           ),
    //         ),
    //         Container(
    //           height: _alphabetChildStyle.height,
    //           // height: 540,
    //           child: SingleChildScrollView(
    //             scrollDirection: Axis.horizontal,
    //             child: Row(
    //               mainAxisSize: MainAxisSize.min,
    //               children: _alphabetChildren,
    //             ),
    //           ),
    //         ),
    //       ],
    //     );
    //   }
    // }

    return Container();
  }

  void _initJump() {
    for (int i = 0; i < widget.children.length; i++) {
      GlobalKey<_ChildState> globalKey = new GlobalKey<_ChildState>();
      _children.add(
        Child(
          key: globalKey,
          widget: widget.children[i],
          index: i,
          sizeCallBack: (size, index) {
            if (_jumpPosition[index] == 0) {
              if (index != 0) {
                _jumpPosition[index] = size.height + _jumpPosition[index - 1];
              } else {
                _jumpPosition[index] = size.height;
              }
            }
          },
        ),
      );
      _childKeys.add(globalKey);
    }
  }

  void _initAlphabet() {
    for (int i = 0; i < widget.childrenNavigator.length; i++) {
      GlobalKey<_AlphabetItemState> global =
          new GlobalKey<_AlphabetItemState>();
      _alphabetChildren.add(
        AlphabetItem(
          key: global,
          index: i,
          alphabetChildStyle: _alphabetChildStyle,
          sizeCallBack: (size, index) {},
          name: widget.childrenNavigator[i],
          clickCallBack: (index) {
            if (!_running) {
              _alphabetKeys[index].currentState!.reload(index);
              _alphabetKeys[_selectIndex].currentState!.reload(index);
              _wantToGo(index);
            }
          },
        ),
      );
      _alphabetKeys.add(global);
    }
  }

  void _wantToGo(int index) {
    _running = true;

    if (index == 0) {
      _scrollController
          .animateTo(
            0,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          )
          .then((value) => _running = false);
      _selectIndex = index;
    } else {
      if (_jumpPosition[index - 1] == 0) {
        _loadNum = index - 1 - _selectIndex;
        _wantToGoRecursion(index);
      } else {
        _scrollController
            .animateTo(
              _jumpPosition[index - 1],
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            )
            .then((value) => _running = false);
        _selectIndex = index;
      }
    }
  }

  void _wantToGoRecursion(int index) {
    _scrollController
        .animateTo(
      _jumpPosition[_selectIndex],
      duration: Duration(milliseconds: 300 ~/ _loadNum),
      curve: Curves.easeIn,
    )
        .then((value) {
      _selectIndex++;
      if (_selectIndex < index - 1) {
        _wantToGoRecursion(index);
      } else {
        _selectIndex = index;
        _loadNum = 0;
        _running = false;
      }
    });
  }

  void _listChange(double offset) {
    if (offset > _jumpPosition[_selectIndex]) {
      _alphabetKeys[_selectIndex + 1].currentState!.reload(_selectIndex + 1);
      _alphabetKeys[_selectIndex].currentState!.reload(_selectIndex + 1);
      _selectIndex++;
    } else {
      if (offset == 0 && _selectIndex == 1) {
        _alphabetKeys[_selectIndex - 1].currentState!.reload(_selectIndex - 1);
        _alphabetKeys[_selectIndex].currentState!.reload(_selectIndex - 1);
        _selectIndex--;
      } else if (_selectIndex > 1 && offset < _jumpPosition[_selectIndex - 2]) {
        _alphabetKeys[_selectIndex - 1].currentState!.reload(_selectIndex - 1);
        _alphabetKeys[_selectIndex].currentState!.reload(_selectIndex - 1);
        _selectIndex--;
      }
    }
  }
}

typedef SizeCallBack = void Function(Size size, int index);

class Child extends StatefulWidget {
  final Widget widget;
  final int index;
  final SizeCallBack sizeCallBack;

  Child(
      {Key? key,
      required this.widget,
      required this.sizeCallBack,
      required this.index})
      : super(key: key);

  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  bool _alreadyCallback = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (!_alreadyCallback) {
        widget.sizeCallBack(
            context.findRenderObject()!.semanticBounds.size, widget.index);
        _alreadyCallback = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.widget;
  }
}

typedef ClickCallBack = void Function(int index);

class AlphabetItem extends StatefulWidget {
  final String name;
  final int index;
  final AlphabetChildrenStyle alphabetChildStyle;
  final SizeCallBack sizeCallBack;
  final ClickCallBack clickCallBack;

  AlphabetItem({
    Key? key,
    required this.name,
    required this.index,
    required this.sizeCallBack,
    required this.clickCallBack,
    required this.alphabetChildStyle,
  }) : super(key: key);

  @override
  _AlphabetItemState createState() => _AlphabetItemState();
}

class _AlphabetItemState extends State<AlphabetItem> {
  bool _isSelect = false;

  Color get _getBgColor {
    return _isSelect
        ? widget.alphabetChildStyle.selectBackgroundColor
        : widget.alphabetChildStyle.unSelectBackgroundColor;
  }

  Color get _getTextColor {
    return _isSelect
        ? widget.alphabetChildStyle.selectTextColor
        : widget.alphabetChildStyle.unSelectTextColor;
  }

  @override
  void initState() {
    super.initState();
    if (widget.index == 0) {
      _isSelect = true;
    }

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (mounted) {
        widget.sizeCallBack(
            context.findRenderObject()!.semanticBounds.size, widget.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.clickCallBack(widget.index);
      },
      child: Container(
        margin: widget.alphabetChildStyle.margin ??
            EdgeInsets.only(
              top: 10,
            ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: widget.alphabetChildStyle.childWidth,
            height: widget.alphabetChildStyle.childHeight,
            color: _getBgColor,
            alignment: Alignment.center,
            child: Text(
              widget.name,
              style: TextStyle(
                color: _getTextColor,
                fontSize: widget.alphabetChildStyle.testSize,
                decoration: widget.alphabetChildStyle.textDecoration,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void reload(index) {
    if (index != widget.index) {
      _isSelect = false;
    } else {
      _isSelect = true;
    }
    setState(() {});
  }
}
