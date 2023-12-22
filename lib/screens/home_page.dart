import 'package:flutter/material.dart';

import '../data/questions_list.dart';
import '../models/question.dart';
import '../widgets/question_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Poker"),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (BuildContext context, int index) {
          for (Question question in questions) {
            return QuestionItem(question: question);
          }
          return null;
        },
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
