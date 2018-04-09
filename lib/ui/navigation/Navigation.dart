import 'package:crypto_coin_forum/ui/screen/chat/ChatScreen.dart';
import 'package:crypto_coin_forum/ui/themes/Themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation {
  static final Navigation singleton = new Navigation._internal();

  ThemeData _activeTheme = LoginTheme;

  Function _themeChangeCallback;

  factory Navigation() {
    return singleton;
  }

  Navigation._internal();

  openChat(BuildContext context) {
    _activeTheme = ChatTheme;

    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new ChatScreen()));

    _themeChangeCallback();
  }

  navigateUp(BuildContext context) {
    _activeTheme = LoginTheme;

    Navigator.pop(context);

    _themeChangeCallback();
  }

  getTheme() {
    return _activeTheme;
  }

  void registerStateChange(Function param0) {
    _themeChangeCallback = param0;
  }
}