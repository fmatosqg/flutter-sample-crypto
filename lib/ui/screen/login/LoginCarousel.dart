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
    return

      new SizedBox(
        width: 200.0,
        child: new Card (
          color: Colors.white,
          child: new Align(
            alignment: Alignment.bottomCenter,

            child: new Column(
              children: <Widget>[
                new Text("asdad $position"),

                new SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: new Image(
                    image: new AssetImage(
                        'assets/images/bitcoin2.png'),),
                ),
              ],
            ),
          ),
        ),
      );
  }

}