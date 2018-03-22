import 'package:crypto_coin_forum/ui/CryptoColors.dart';
import 'package:crypto_coin_forum/ui/screen/login/LoginCarousel.dart';
import 'package:crypto_coin_forum/ui/screen/login/VideoSample.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new Column(

        children: <Widget>[
          new Expanded(child: new Container()),
          new Flexible(
            child: new Text("Welcome to\nCrypto Forum",
              textAlign: TextAlign.center,
              style: Theme
                  .of(context)
                  .textTheme
                  .title,),
          ),

          new Expanded(child: new Container()),
          new Flexible(
            fit: FlexFit.loose,
            child: new Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: new Text(
                "Join our forums or transfer currencies with friends",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .subhead,),
            ),
          ),

          new Expanded(child: new Container()),

          new LoginCarousel(),

          new Expanded(child: new Container()),

          new Flexible(
              child: new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Align(
                    alignment: Alignment.bottomCenter,
                    child: new FittedBox(
                        child: new Row(
                          children: <Widget>[
                            new SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: new Image(
                                  image: new AssetImage(
                                      'assets/images/bitcoin2.png'),)),
                            new Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: new Text("butterfly", style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,),
                            ),
                          ],
                        )
                    )
                ),
              )
          ),
        ],
      ),
    );
  }

}

