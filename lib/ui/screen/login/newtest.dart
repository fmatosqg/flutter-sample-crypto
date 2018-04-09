import 'package:crypto_coin_forum/main.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videooo extends StatefulWidget {
  String get title => "aaaa";

  @override
  State<StatefulWidget> createState() => new _MyHomePageStateee1();
}

class _MyHomePageStateee1 extends State<Videooo> {
  VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = new VideoPlayerController.network(
      'http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4',
    )
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new AspectRatio(
            aspectRatio: 1280 / 720,
            child: new VideoPlayer(_controller),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed:
            _controller.value.isPlaying ? _controller.pause : _controller.play,
        child: new Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
