import 'package:dental_news/utils/utils.dart';
import 'package:flutter/material.dart';

final ThemeData themeDataLight = ThemeData(
  scaffoldBackgroundColor: Color.fromARGB(255, 239, 239, 240),
  primaryColor: const Color(0xFF8009B8),
  cardColor: const Color(0xFFFFFFFF),
  hoverColor: const Color(0xFF8009B8),
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 11, 238, 227)),
  brightness: Brightness.light,
  splashColor: color.black,
  focusColor: color.black,
  hintColor: color.black,
  disabledColor: Color.fromARGB(255, 211, 3, 65),
  highlightColor: Color.fromARGB(255, 122, 12, 173),
  dividerColor: Colors.white,
//  indicatorColor:,
//  primaryColorDark:,
//  primaryColorLight:,
//  primarySwatch:,
//  secondaryHeaderColor:,
//  shadowColor:,
//  unselectedWidgetColor:,
);

final ThemeData themeDataDark = ThemeData(
  hoverColor: const Color(0xFFFFFFFF),
  scaffoldBackgroundColor: const Color(0xFF3D3D3D),
  cardColor: const Color(0xFFFFFFFF),
  primaryColor: const Color(0xFF3D3D3D),
  colorScheme: const ColorScheme.dark(),
  brightness: Brightness.dark,
  splashColor: color.white,
  focusColor: color.white,
  hintColor: color.black,
  disabledColor: Color.fromARGB(255, 205, 206, 205).withOpacity(0.2),
  highlightColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
  dividerColor: Colors.white,
//  indicatorColor:,
//  primaryColorDark:,
//  primaryColorLight:,
//   primarySwatch:,
//  secondaryHeaderColor:,
//  shadowColor:,
//  unselectedWidgetColor:,
);
