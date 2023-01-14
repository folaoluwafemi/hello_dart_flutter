import 'package:flutter/material.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = _lightTheme;
}

final ThemeData _lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.deepOrangeAccent,
  colorScheme: _lightColorScheme,
);

const ColorScheme _lightColorScheme = ColorScheme.light(
  primary: Colors.deepOrangeAccent,
  secondary: Colors.brown,
);
