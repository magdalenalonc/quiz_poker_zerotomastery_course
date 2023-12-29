import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 12, 63, 145),
      background: Colors.white70,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 12, 63, 145),
      titleTextStyle: TextStyle(fontSize: 25.0),
      centerTitle: true,
    ),
  );
}
