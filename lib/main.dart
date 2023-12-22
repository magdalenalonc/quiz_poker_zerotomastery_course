import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz Poker",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 12, 63, 145),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 12, 63, 145),
        ),
      ),
      home: const HomePage(),
    );
  }
}


