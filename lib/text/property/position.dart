class Position extends Object {
  double? left;

  double? top;

  double? right;

  double? bottom;

  double? width;

  double? height;

  Position({
    this.right,
    this.left,
    this.height,
    this.bottom,
    this.top,
    this.width,
  })  : assert(left == null || right == null || width == null),
        assert(top == null || bottom == null || height == null);
}
