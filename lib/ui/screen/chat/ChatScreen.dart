import 'package:crypto_coin_forum/ui/navigation/Navigation.dart';
import 'package:crypto_coin_forum/ui/screen/chat/Sparkles.dart';
import 'package:crypto_coin_forum/ui/screen/login/LoginCarousel.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
//              color: Colors.blue,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => Navigation.singleton.navigateUp(context),
          ),
          title: new Text("Chat"),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.playlist_play),
              tooltip: 'Air it',
              color: Theme.of(context).iconTheme.color,
              onPressed: () {},
//              onPressed: _airDress,
            ),
          ],
        ),
//      backgroundColor: Colors.white,
        body: _buildView());
  }

  Widget _buildView() {
    return new SingleChildScrollView(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Text("ss"),
            new Container(
              color: Colors.blue,
              child: new Text("asds"),
            ),
            new Container(
              color: Colors.green,
              height: 100.0,
              width: 100.0,
              child: new Text("dddd"),
            ),
            new Container(
              width: 100.0,
              height: 100.0,
              color: Colors.black,
              child: new Sparkles(),
            ),
            new Container(
              width: 100.0,
              height: 100.0,
              color: Colors.blue,
              child: new Sparkles(),
            ),
            new Container(
              width: 200.0,
              height: 200.0,
              color: Colors.red,
              child: new Sparkles(),
            ),
            new Container(
              height: 200.0,
              width: 200.0,
              color: Colors.yellow,
              child: new LoginCard(text: "hello"),
            ),
          ],
        ),
      ),
    );
  }
}
