import 'dart:ui';

import 'package:crypto_coin_forum/assetGenerator/gen/AppFonts.dart';
import 'package:crypto_coin_forum/ui/CryptoColors.dart';
import 'package:flutter/material.dart';


class LoginCarousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginCarouselState();

}

class LoginCarouselState extends State<LoginCarousel> {

  int _lastPosition = 0;

  List<LoginCard>_children;

  @override
  Widget build(BuildContext context) {
    _children = getChildren();
    return new SizedBox(
      height: 150.0,
      child: new PageView(children: _children,
        onPageChanged: (position) {
          _children[position].animateForward();
          _children[_lastPosition].animateBackwards();
          _lastPosition = position;
        },
        controller: new PageController(
          viewportFraction: 0.7,
        ),
      ),
    );
  }

  List<Widget> getChildren() {
    List<LoginCard> list = new List();

    for (int i = 0; i < 20; i++) {
      list.add(buildLoginCard(i));
    }

    return list;
  }

  Widget buildLoginCard(int position) {
    return new LoginCard(
      text: "Anonymous", assetPath: 'assets/images/bitcoin2.png',);
  }
}

class LoginCard extends StatefulWidget {

  final String text;
  final String assetPath;

  _LoginCardState _loginCardState;

  LoginCard({Key key, this.text, this.assetPath}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    _loginCardState = new _LoginCardState();
    return _loginCardState;
  }


  Widget getChild() {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Text(text != null ? text : "",
          style: new TextStyle(fontFamily: AppFonts.Comfortaa,
              fontSize: 24.0,
              color: Colors.white),
        ),
        new Padding(padding: const EdgeInsets.all(8.0)),
        new SizedBox(
            width: 20.0,
            height: 20.0,
            child: new Image.asset(assetPath)
        )
      ],
    );
  }

  void animateForward() {
    _loginCardState.animateForward();
  }


  void animateBackwards() {
    _loginCardState.animateBackwards();
  }

}

class _LoginCardState extends State<LoginCard>
    with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController animationController;

  static const _animationMaxValue = 30.0;
  static const _animationMinValue = 0.8;

  @override
  initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),);

    animation =
    new Tween(begin: _animationMinValue, end: 1.0)
        .animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }


  animateForward() {
    animationController.forward();
  }

  animateBackwards() {
    animationController.reverse();
  }

  bool _highlight = false;

  final externalRadius = 20.0;
  static const double internalPadding = 3.0;

  static const maxElevation = 15.0;

  @override
  Widget build(BuildContext context) {
    return new Transform (
      transform: new Matrix4
          .diagonal3Values(animation.value, animation.value, 1.0)
        ..setTranslationRaw(10.5, 10.5, 10.5),
      child: new Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        child: new Material(
            color: CryptoColors.redMatrix,
//            shape: new RoundedRectangleBorder(
//                borderRadius: new BorderRadius.circular(20.0),
//                side: new BorderSide(width: 3.0, color: Colors.white)),
            shape: new _LoginCardShape(),
            elevation: 4.0,
            child: new RaisedButton(onPressed: () {},
              color: CryptoColors.redMatrix,
              onHighlightChanged: _handleHighlightChanged,
              child: widget.getChild(),)
        ),
      ),
    );
  }

  void _handleHighlightChanged(bool value) {
    setState(() {
      _highlight = value;
    });
  }
}

class _LoginCardShape extends RoundedRectangleBorder {

  static final _borderWidth = 10.0;

  @override
  Path getOuterPath(Rect rect, { TextDirection textDirection }) {
    Path path = new Path();
    path
      ..moveTo(_borderWidth, _borderWidth)

      ..relativeCubicTo(
        rect.right / 3.0, 12.0,
        rect.right * 2.0 / 3.0, -10.0,
        rect.right-_borderWidth*2, 0.0,)

      ..relativeCubicTo(10.0, rect.bottom / 3.0,
        -10.0, rect.bottom * 1.6 / 3.0,
        0.0, rect.bottom-_borderWidth*2)

      ..relativeCubicTo(
      -rect.right / 3.0, -10.0,
      -rect.right * 2.0 / 3.0, 15.0,
      -rect.right+_borderWidth*2, 0.0,)

      ..relativeCubicTo(10.0, -rect.bottom / 3.0,
        -10.0, -rect.bottom * 1.6 / 3.0,
        0.0, -rect.bottom+_borderWidth*2)

    ;

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, { TextDirection textDirection }) {
    final RRect outer = borderRadius.resolve(textDirection).toRRect(rect);
    final RRect inner = outer.deflate(rect.right);
    final Paint paint = new Paint()
      ..color = side.color;
    final outerPath = getOuterPath(rect);
    final transformMatrix = new Matrix4
        .diagonal3Values(0.6, 0.6, 1.0)
      ..translate(rect.right * 0.6 / 2.0, rect.bottom * 0.6 / 2.0, 0.0);
    final innerPath = outerPath.transform(transformMatrix.storage);

    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = _borderWidth;
//    canvas.clipPath(innerPath);
//    canvas.
    canvas.drawPath(outerPath, paint);
  }

  _LoginCardShape()
      : super(side: new BorderSide(width: _borderWidth, color: Colors.white));

}