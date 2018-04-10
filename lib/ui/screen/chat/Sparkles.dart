import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;

class Sparkles extends CustomPaint {
  @override
  CustomPainter get painter => new _SparklesPainter();

  @override
  // TODO: implement child
  Widget get child => new Container(
//          child: new Image.asset("assets/images/yang.png")
      );
}

class _SparklesPainter extends CustomPainter {
  static final _yang = "assets/images/yang.png";

  @override
  void paint(Canvas canvas, Size size) {
    var center = new Offset(size.width / 2, size.height / 2);
    _drawParticle(canvas, center);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    print("Repaint");
    return true;
  }

  void _drawAura(Canvas canvas, Offset center) {
    double size = 90.0;

    Paint paint = new Paint();

    Offset off = new Offset(size / 2, size / 2);
    Rect rect = new Rect.fromPoints(center - off, center + off);

    paint.maskFilter = new MaskFilter.blur(BlurStyle.outer, 10.0);
    paint.color = Colors.yellow;

    canvas.drawOval(rect, paint);
  }

  ui.Image _cachedImage = null;

  void _drawImage(Canvas canvas, Size size) async {
    if (_cachedImage != null) {
      print("cached image instantiated: $_cachedImage");
      Paint paint = new Paint();
      var offset = new Offset(size.width, size.height);

//      canvas.drawOval(rect, paint)
      _drawAura(canvas, new Offset(0.0, 0.0));
      canvas.drawImage(_cachedImage, offset, paint);
    }
    ByteData bd = await rootBundle.load(_yang);
    Uint8List lst = new Uint8List.view(bd.buffer);
    var codec = await ui.instantiateImageCodec(lst);
    var frameInfo = await codec.getNextFrame();

    ui.Image bkImage = frameInfo.image;
    print("bkImage instantiated: $bkImage");
    _cachedImage = bkImage;

    Paint paint = new Paint();
    var offset = new Offset(size.width, size.height);
//    canvas.drawImage(_cachedImage, offset, paint);
  }

  void _drawParticle(Canvas canvas, Offset center) {
    double size = 3.9;
    double sigma = 1.0;

    Paint paint = new Paint();

    Offset off = new Offset(size / 2, size / 2);
    Rect rect = new Rect.fromPoints(center - off, center + off);

    paint.color = Colors.yellow;

    paint.maskFilter = new MaskFilter.blur(BlurStyle.normal, sigma);

    canvas.drawOval(rect, paint);
  }
}
