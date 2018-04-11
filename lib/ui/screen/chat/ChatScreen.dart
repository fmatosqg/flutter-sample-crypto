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
            new TransitionThing(),
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
              color: Colors.blueGrey,
              child: new SparklingBox(),
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

class TransitionThing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new TransitionThingState();
}

class TransitionThingState extends State<TransitionThing> {
  List<Widget> _list;
  Widget _button;


  @override
  Widget build(BuildContext context) {


    return new Container(
      height: 300.0,
      color: Colors.blueGrey,
      child: new Column(
        children: _list,
      ),
    );
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _list = [];
    _button = new IconButton(
        icon: new Icon(Icons.transform),
        onPressed: () {
          setState(() {
            _list.add(new Text("More"));
            print("aaa");
          });
        });

    _list.add(_button);
    _list.add(new Text("T1"));

  }
}
