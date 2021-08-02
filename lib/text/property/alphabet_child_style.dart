import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlphabetChildStyle extends Object{
  final Color selectTextColor;

  final Color unSelectTextColor;

  final Color selectBackgroundColor;

  final Color unSelectBackgroundColor;

  final double width;

  final double height;

  /// 在文本附近绘制的装饰（例如，下划线）。
  ///
  /// 可以使用 [TextDecoration.combine] 应用多种装饰
  /// The decorations to paint near the text (e.g., an underline).
  ///
  /// Multiple decorations can be applied using [TextDecoration.combine].
  final TextDecoration textDecoration;

  EdgeInsetsGeometry? margin;

  AlphabetChildStyle( {
    this.width = 16,
    this.height = 16,
    this.margin,
    this.selectBackgroundColor = Colors.black,
    this.unSelectBackgroundColor = Colors.white,
    this.selectTextColor = Colors.white,
    this.unSelectTextColor = Colors.black,
    this.textDecoration = TextDecoration.none,
  });
}
