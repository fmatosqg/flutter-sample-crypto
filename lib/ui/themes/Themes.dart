import 'package:crypto_coin_forum/assetGenerator/gen/AppFonts.dart';
import 'package:crypto_coin_forum/ui/CryptoColors.dart';
import 'package:flutter/material.dart';

final ThemeData LoginTheme = new ThemeData(
  scaffoldBackgroundColor: CryptoColors.redCardinal,
  textTheme: new TextTheme(
    title: new TextStyle(
      color: Colors.white,
      fontSize: 40.0,
      fontFamily: AppFonts.Aclonica,
    ),
    subhead: new TextStyle(color: Colors.white, fontFamily: AppFonts.Enriqueta),
    body1: new TextStyle(color: Colors.yellow),
    body2: new TextStyle(color: Colors.purple),
    caption: new TextStyle(color: Colors.white),
    display1: new TextStyle(color: Colors.purple),
    display2: new TextStyle(color: Colors.purple),
    display3: new TextStyle(color: Colors.purple),
    display4: new TextStyle(color: Colors.purple),
    headline: new TextStyle(color: Colors.purple),
  ),
  iconTheme: new IconThemeData(color: Colors.white),
);

final ThemeData ChatTheme = new ThemeData(
  scaffoldBackgroundColor: Colors.white,
  iconTheme: new IconThemeData(color: Colors.white),
);
