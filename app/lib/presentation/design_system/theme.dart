import 'package:flutter/material.dart';

const Color success = Color(0xFF00C851);
const Color error = Color(0xFFff4444);

final ThemeData appTheme = ThemeData(
  platform: TargetPlatform.iOS,
  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(fontSize: 16),
  ),
);
