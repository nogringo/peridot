import 'package:flutter/material.dart';

ThemeData appTheme(Brightness brightness) => ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.teal,
    brightness: brightness,
  ),
);
