import 'package:flutter/material.dart';

class LoginCardShape extends RoundedRectangleBorder {
  static final _borderWidth = 10.0;

  LoginCardShape(
      {BorderSide side: const BorderSide(width: 10.0, color: Colors.white)})
      : super(side: side);

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Path path = new Path();
    path
      ..moveTo(_borderWidth, _borderWidth)
      ..relativeCubicTo(
        rect.right / 3.0,
        12.0,
        rect.right * 2.0 / 3.0,
        -10.0,
        rect.right - _borderWidth * 2,
        0.0,
      )
      ..relativeCubicTo(10.0, rect.bottom / 3.0, -10.0, rect.bottom * 1.6 / 3.0,
          0.0, rect.bottom - _borderWidth * 2)
      ..relativeCubicTo(
        -rect.right / 3.0,
        -10.0,
        -rect.right * 2.0 / 3.0,
        15.0,
        -rect.right + _borderWidth * 2,
        0.0,
      )
      ..relativeCubicTo(10.0, -rect.bottom / 3.0, -10.0,
          -rect.bottom * 1.6 / 3.0, 0.0, -rect.bottom + _borderWidth * 2);

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    final Paint paint = new Paint()..color = side.color;
    final outerPath = getOuterPath(rect);

    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = _borderWidth;
    canvas.drawPath(outerPath, paint);
  }
}
