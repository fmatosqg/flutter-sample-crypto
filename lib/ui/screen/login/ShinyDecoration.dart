import 'package:crypto_coin_forum/ui/CryptoColors.dart';
import 'package:flutter/material.dart';

class ShinyDecoration extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]) {
    return new _ShinyBoxPainter();
  }
}

class _ShinyBoxPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = new Paint();

    paint.color = CryptoColors.greyBorder;
    paint.color = Colors.white;

    Offset rightBottom = new Offset(offset.dx, offset.dy)
        .translate(
        configuration.size.width, configuration.size.height);

    Rect boundaries = new Rect.fromPoints(offset, rightBottom);

    var size = new Size(100.0, 100.0);
    Offset offsetCircle =
    new Offset(offset.dx, offset.dy)
        .translate(
        configuration.size.width / 2.0, configuration.size.height / 2.0);


    new FractionalOffset.fromOffsetAndSize(offset, size);

//    canvas.drawCircle(offsetCircle, 30.0, paint);

    canvas.drawCircle(offset, 10.0, paint);

//    canvas.drawAtlas(atlas, transforms, rects, colors, blendMode, cullRect, paint)

    var outer = new RRect.fromRectAndRadius(
        boundaries, new Radius.circular(10.0));

    Offset diff = new Offset(2.0, 2.0); // borderwidth

    Rect innerRect = new Rect.fromPoints(offset + diff, rightBottom - diff);

//    innerRect
    var inner = new RRect.fromRectAndRadius(
        innerRect, new Radius.circular(10.0));


    canvas.drawDRRect(outer, inner, paint);
  }

}