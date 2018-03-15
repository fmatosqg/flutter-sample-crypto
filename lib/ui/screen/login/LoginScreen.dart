import 'package:crypto_coin_forum/ui/CryptoColors.dart';
import 'package:crypto_coin_forum/ui/widget/CryptoToolbar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(


      body: new Column(children: <Widget>[
        new Container(height: 50.0,),

        new Expanded(
          child: new Text("Crypto Forum", style: Theme
              .of(context)
              .textTheme
              .title,),
        ),

        new Expanded(
          child: new Text("butterfly", style: Theme
              .of(context)
              .textTheme
              .caption,),
        ),


      ],
      )
      ,);
  }

}


class aaaa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new aaaaState();

}

class aaaaState extends State<aaaa> {
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new TextField(
        decoration: getDecoration(),
      )
    ],);
  }

  InputDecoration getDecoration() {
    return new InputDecoration(
      errorText: "errrror",
      hintText: "hint",
      counterText: "counter",
      helperText: "helper",
      prefixText: "prefix",
      labelText: "label",

    );
  }


}


final ThemeData LoginTheme = new ThemeData(

  scaffoldBackgroundColor: CryptoColors.redCardinal,

  textTheme: new TextTheme(
    title: new TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontFamily: 'Enriqueta',),
    subhead: new TextStyle(color: Colors.white,
        fontFamily: 'Jura'),

    body1: new TextStyle(color: Colors.yellow),
    body2: new TextStyle(color: Colors.purple),

    caption: new TextStyle(color: Colors.white),

    display1: new TextStyle(color: Colors.purple),
    display2: new TextStyle(color: Colors.purple),
    display3: new TextStyle(color: Colors.purple),
    display4: new TextStyle(color: Colors.purple),

    headline: new TextStyle(color: Colors.purple),


  ),
);
