import 'dart:async';
import 'dart:ui' as ui show Image, ImageFilter;

import 'package:crypto_coin_forum/assetGenerator/gen/AppFonts.dart';
import 'package:crypto_coin_forum/ui/CryptoColors.dart';
import 'package:crypto_coin_forum/ui/screen/login/DotsIndicator.dart';
import 'package:crypto_coin_forum/ui/screen/login/LoginCardShape.dart';
import 'package:flutter/material.dart';

class LoginCarousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginCarouselState();
}

class LoginCarouselState extends State<LoginCarousel> {
  int _lastPosition = 0;

  static const int childrenCount = 10;

  List<LoginCard> _children;

  PageController _controller;

  @override
  Widget build(BuildContext context) {
    _children = getChildren();

    return _buildPagerContainer();
  }

  @override
  initState() {
    super.initState();
    print("Initt");

    _controller = new PageController(
      viewportFraction: 0.7,
      keepPage: true,
    );
    new Future.delayed(new Duration(seconds: 10), () {
      print("Trigger future");

      setState(() {
        _controller.animateToPage(2,
            duration: new Duration(seconds: 1), curve: new ElasticOutCurve());
      });
    });
  }

  @override
  reassemble() {
    super.reassemble();
    print("Come on");
    _controller.animateToPage(_lastPosition + 1,
        duration: new Duration(seconds: 1), curve: new ElasticOutCurve());
    _children[_lastPosition + 1]?.animateForward();
  }

  Widget _buildPager() {
    return new PageView(
      children: _children,
      onPageChanged: (position) {
        _children[position]?.animateForward();
        _children[_lastPosition]?.animateBackwards();
        _lastPosition = position;
      },
      controller: _controller,
    );
  }

  List<LoginCard> getChildren() {
    List<LoginCard> list = new List();

    for (int i = 0; i < childrenCount; i++) {
      list.add(buildLoginCard(i));
    }

    return list;
  }

  Widget buildLoginCard(int position) {
    return new LoginCard(
      text: "Anonymous",
      assetPath: 'assets/images/bitcoin2.png',
    );
  }

  Widget _buildPagerContainer() {
    var pager = _buildPager();
    var stack = new Stack(
      children: <Widget>[
        pager,
        new BackdropFilter(
          filter: new ui.ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: new Container(
            color: CryptoColors.redCardinal.withOpacity(0.1),
          ),
        ),
      ],
    );

    return new Column(
      children: <Widget>[
        new Container(height: 145.0, child: pager),
        new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new DotsIndicator(
            controller: _controller,
            itemCount: childrenCount,
          ),
        ),
        new Text('View messages only ',
            style: Theme.of(context).textTheme.subhead),
      ],
    );
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
        new Text(
          text != null ? text : "",
          style: new TextStyle(
              fontFamily: AppFonts.Comfortaa,
              fontSize: 24.0,
              color: Colors.white),
        ),
        new Padding(padding: const EdgeInsets.all(8.0)),
        new SizedBox(
            width: 20.0, height: 20.0, child: new Image.asset(assetPath))
      ],
    );
  }

  void animateForward() {
    _loginCardState?.animateForward();
  }

  void animateBackwards() {
    _loginCardState?.animateBackwards();
  }
}

class _LoginCardState extends State<LoginCard>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  static const _animationMinValue = 0.8;

  @override
  initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animation = new Tween(begin: _animationMinValue, end: 1.0)
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
    setState(() {});
  }

  animateBackwards() {
    animationController.reverse();
    setState(() {});
  }

  final externalRadius = 10.0;
  static const double internalPadding = 3.0;

  static const maxElevation = 15.0;

  @override
  Widget build(BuildContext context) {
    return new Transform(
      transform:
          new Matrix4.diagonal3Values(animation.value, animation.value, 1.0)
            ..setTranslationRaw(10.5, 10.5, 10.5),
      child: new Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        child: new Material(
            color: CryptoColors.redMatrix,
            shape: new LoginCardShape(
              side: const BorderSide(color: Colors.white),
            ),
            elevation: 4.0,
            child: new RaisedButton(
              onPressed: () {},
              color: CryptoColors.redMatrix,
              onHighlightChanged: _handleHighlightChanged,
              child: widget.getChild(),
            )),
      ),
    );
  }

  void _handleHighlightChanged(bool value) {
    setState(() {});
  }
}
