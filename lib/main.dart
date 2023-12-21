import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Poker"),
      ),
      body: const Center(
        child: Text("Welcome to Quiz Poker!"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showSnackBar(context),
        tooltip: "Press the button",
        child: const Icon(Icons.message),
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Hello there!'),
        action: SnackBarAction(
          label: "Hide",
          onPressed: scaffold.hideCurrentSnackBar,
        ),
      ),
    );
  }
}
