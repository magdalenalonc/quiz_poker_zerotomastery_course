import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'screens/question_form_page.dart';
import 'screens/questions_list_page.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz Poker",
      theme: AppTheme.theme,
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        '/homePage': (BuildContext context) => const HomePage(),
        '/questionsListPage': (BuildContext context) =>
            const QuestionsListPage(),
        '/questionFormPage': (BuildContext context) => const QuestionFormPage(),
      },
    );
  }
}
