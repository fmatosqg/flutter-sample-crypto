import 'dart:math';
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
    var dotCount = 30;

    var random = new Random();
    listDot = [];
    new List.generate(dotCount, (i) {
      double dx = widget._size.width / dotCount.ceilToDouble();

      double x = 010.0; //* i.ceilToDouble() + dx / 2.ceilToDouble();
      double y = 100.0;
      listDot.add(new Dot(new Offset(x, y),
          new Offset(random.nextDouble() - 0.5, random.nextDouble() - 0.5)));
    });
    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 3),
    )
      ..addListener(() {
        for (var node in listDot) {
          node.move(animationController.value);
        }
      })
//          ..repeat(min: 0.0, max: 1.0, period: new Duration(seconds: 3))
      ..repeat();
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
  final Offset _initialPosition;
  final Offset _initialSpeed;

  Offset _updatedPosition;
  double _brightness;

  Dot(this._initialPosition, this._initialSpeed);

  void move(double dt) {
    double curveFactor = Curves.decelerate.transform(dt);

    double a = 0.9;
    double b = 1.0 - a;
    curveFactor = 1.0 - pow(1.0 - dt, 2 * 10) * a - (1.0 - dt) * b;

    _brightness = 1.0 - curveFactor;

    Offset translation = _initialSpeed * curveFactor * 400.0;

    _updatedPosition = _initialPosition + translation;
  }

  void draw(Canvas canvas, Paint paint) {
//    double size = 3.9;

    var sizeSolid = 4.0 * _brightness;

    var sizeFuzzy = sizeSolid * 3.0;

    double sigma = 4.0;

    Paint paint = new Paint();

    Offset center = new Offset(_updatedPosition.dx, _updatedPosition.dy);
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
