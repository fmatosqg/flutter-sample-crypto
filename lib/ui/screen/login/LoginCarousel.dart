import 'package:crypto_coin_forum/assetGenerator/gen/AppFonts.dart';
import 'package:crypto_coin_forum/ui/CryptoColors.dart';
import 'package:crypto_coin_forum/ui/themes/Themes.dart';
import 'package:flutter/material.dart';


class LoginCarousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginCarouselState();

}

class LoginCarouselState extends State<LoginCarousel> {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: 100.0,
      child: new ListView(
          scrollDirection: Axis.horizontal,
          children: getChildren()
      ),
    );
  }

  List<Widget> getChildren() {
    List list = new List();

    for (int i = 0; i < 20; i++) {
      list.add(buildLoginCard(i));
    }

    return list;
  }

  Widget buildLoginCard(int position) {
    return new LoginCard(
      text: "Login method 1", assetPath: 'assets/images/bitcoin2.png',);
  }
}

class LoginCard extends StatefulWidget {

  final String text;
  final String assetPath;

  const LoginCard({Key key, this.text, this.assetPath}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _LoginCardState();

  Widget getChild() {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Text(text != null ? text : "",
          style: new TextStyle(fontFamily: AppFonts.Enriqueta),),
        new SizedBox(
            width: 10.0,
            height: 10.0,
            child: new Image.asset(assetPath))
      ],
    );
  }

}

class _LoginCardState extends State<LoginCard> {

  bool _highlight = false;

  final externalRadius = 20.0;
  static const double internalPadding = 2.0;

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.all(4.0),
//padding: const EdgeInsets.all(10.0),
        child: new Material(
            key: new Key("THAT"),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.all(
                    new Radius.circular(externalRadius))),
            type: MaterialType.card,
            color: Colors.green,
            elevation: _highlight ? 5.0 + 10.0 : 5.0,

            child: new Container(
              color: Colors.white,
              padding: const EdgeInsets.all(internalPadding),
              child: new Material(
                color: Colors.white,

                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.all(
                        new Radius.circular(externalRadius - internalPadding))
                ),
//              padding: new EdgeInsets.all(4.0),
                child: new RaisedButton(onPressed: () {},
                  color: CryptoColors.anotherRed,
                  onHighlightChanged: _handleHighlightChanged,
                  child: widget.getChild(),
                ),
              ),
            )
        )
    );
  }

  void _handleHighlightChanged(bool value) {
    setState(() {
      _highlight = value;
    });
  }
}