import 'package:crypto_coin_forum/ui/screen/login/LoginCarousel.dart';
import 'package:crypto_coin_forum/ui/screen/login/VideoSample.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(


      body: new Column(

        children: <Widget>[
          new Container(height: 50.0,),

          new Expanded(
            child: new Text("Crypto Forum", style: Theme
                .of(context)
                .textTheme
                .title,),
            flex: 10,
          ),
//          new PlayerLifeCycle(
//            'http://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4',
//                (context, videoController) =>
//            new AspectRatioVideo(videoController),
//          ),

          new Flexible (
              flex: 5,
              child: new LoginCarousel()),


          new Expanded(
              flex: 4,
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

