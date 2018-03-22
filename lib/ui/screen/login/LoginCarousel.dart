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
      height: 200.0,
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
      text: "Anonymous", assetPath: 'assets/images/bitcoin2.png',);
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
          style: new TextStyle(fontFamily: AppFonts.Comfortaa,
              fontSize: 24.0,
              color: Colors.white),
        ),
        new Padding(padding: const EdgeInsets.all(8.0)),
        new SizedBox(
            width: 20.0,
            height: 20.0,
            child: new Image.asset(assetPath))
      ],
    );
  }

}

class _LoginCardState extends State<LoginCard> {

  bool _highlight = false;

  final externalRadius = 20.0;
  static const double internalPadding = 3.0;

  static const maxElevation = 15.0;

  @override
  Widget build(BuildContext context) {
    return new Container(
      // prevents clipping on shadow
        margin: const EdgeInsets.only(
            bottom: maxElevation * 2, left: 4.0, right: 4.0),
        child: new Material(
            key: new Key("THAT"),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.all(
                    new Radius.circular(externalRadius))),
            type: MaterialType.card,
            elevation: _highlight ? maxElevation : 5.0,

            child: new Container(
              color: Colors.white,
              padding: const EdgeInsets.all(internalPadding),
              child: new Material(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.all(
                        new Radius.circular(externalRadius - internalPadding))
                ),
                child: new RaisedButton(
                  onPressed: () {},
                  color: CryptoColors.redMatrix,

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