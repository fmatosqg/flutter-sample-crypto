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

    configuration.
    canvas.drawCircle(new Offset(30.0, 30.0), 30.0, paint);
  }

}