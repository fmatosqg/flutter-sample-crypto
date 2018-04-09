import 'package:crypto_coin_forum/ui/navigation/Navigation.dart';
import 'package:crypto_coin_forum/ui/screen/login/LoginScreen.dart';
import 'package:crypto_coin_forum/ui/themes/Themes.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  ThemeData _theme = LoginTheme;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Navigation.singleton.registerStateChange(() {
      setState(() {
        _theme = Navigation.singleton.getTheme();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: Navigation.singleton.getTheme(),
      home: new LoginScreen(),
    );
  }
}
