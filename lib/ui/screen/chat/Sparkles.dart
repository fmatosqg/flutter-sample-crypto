import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class SparklingBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new _SparklingBoxx(MediaQuery.of(context).size);
  }
}

class _SparklingBoxx extends StatefulWidget {
  Size _size;

  _SparklingBoxx(this._size);

  @override
  State<StatefulWidget> createState() => new _SparklingBoxState();
}

class _SparklingBoxState extends State<_SparklingBoxx>
    with TickerProviderStateMixin {
  List<Dot> listDot;

  AnimationController animationController;

  @override
  void initState() {
    var dotCount = 10;

    listDot = [];
    new List.generate(dotCount, (i) {
      double dx = widget._size.width / dotCount.ceilToDouble();

      double x = 010.0 * i.ceilToDouble() + dx / 2.ceilToDouble();
      double y = 01.0;
      listDot.add(new Dot(x, y));
    });
    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 10),
    )
      ..addListener(() {
        for (var node in listDot) {
          node.move(animationController.value);
        }
      })
      ..repeat(min: 0.0, max: 1.0, period: new Duration(seconds: 3))
//    ..repeat()
    ;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
        animation: new CurvedAnimation(
            parent: animationController, curve: Curves.easeInOut),
        builder: _buildBody);
  }

  Widget _buildBody(BuildContext context, Widget child) {
    return new CustomPaint(
      painter: new _SparksPainter(listDot),
    );
  }
}

class _SparksPainter extends CustomPainter {
  List<Dot> listDot;

  _SparksPainter(this.listDot);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    var paint = new Paint();
    paint.color = Colors.yellow;

    for (var dot in listDot) {
      dot.draw(canvas, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Dot {
  double y;
  double x;

  final double initialX, initialY;

  Dot(this.initialX, this.initialY);

  void move(double dt) {
    y = initialY + Curves.elasticOut.transform(dt) * 100.0;
    x = initialX;
  }

  void draw(Canvas canvas, Paint paint) {
//    double size = 3.9;

    var sizeSolid = 2.0;
    var sizeFuzzy = sizeSolid * 3;

    double sigma = 4.0;

    Paint paint = new Paint();

    Offset center = new Offset(x, y);
    Offset offFuzzy = new Offset(sizeFuzzy / 2, sizeFuzzy / 2);
    Rect rectFuzzy = new Rect.fromPoints(center - offFuzzy, center + offFuzzy);

    paint.color = Colors.yellow;

    paint.maskFilter = new MaskFilter.blur(BlurStyle.normal, sigma);
    canvas.drawOval(rectFuzzy, paint);

    paint.maskFilter = null;
    Offset offSolid = new Offset(sizeSolid / 2, sizeSolid / 2);
    Rect rectSolid = new Rect.fromPoints(center - offSolid, center + offSolid);
    canvas.drawOval(rectSolid, paint);
  }
}

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
