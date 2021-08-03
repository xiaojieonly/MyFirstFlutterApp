import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlphabetChildrenStyle extends Object{
  final Color selectTextColor;

  final Color unSelectTextColor;

  final double testSize;

  final Color selectBackgroundColor;

  final Color unSelectBackgroundColor;

  final double childWidth;

  final double childHeight;

  final double totalWidth;

  final double totalHeight;

  final Color? childrenBackgroundColor;

  /// 在文本附近绘制的装饰（例如，下划线）。
  ///
  /// 可以使用 [TextDecoration.combine] 应用多种装饰
  /// The decorations to paint near the text (e.g., an underline).
  ///
  /// Multiple decorations can be applied using [TextDecoration.combine].
  final TextDecoration textDecoration;

  EdgeInsetsGeometry? margin;

  final Axis alphabetDirection;

  AlphabetChildrenStyle(  {
    this.childWidth = 16,
    this.childHeight = 16,
    this.totalWidth = 16,
    this.totalHeight = 450,
    this.margin,
    this.selectBackgroundColor = Colors.black,
    this.unSelectBackgroundColor = Colors.white,
    this.selectTextColor = Colors.white,
    this.unSelectTextColor = Colors.black,
    this.textDecoration = TextDecoration.none,
    this.alphabetDirection = Axis.vertical,
    this.childrenBackgroundColor,
    this.testSize = 10,
  });
}

