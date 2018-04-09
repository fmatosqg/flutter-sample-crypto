import 'package:crypto_coin_forum/ui/navigation/Navigation.dart';
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
          ]),
//      backgroundColor: Colors.white,
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Text("dsdsds"),
            new Text("dsdsdsa"),
            new Icon(Icons.playlist_play),
          ],
        ),
      ),
    );
  }
}
