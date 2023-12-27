import 'package:flutter/material.dart';

import '../data/questions_list.dart';
import '../widgets/question_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Poker"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > constraints.maxHeight) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: questions.length,
              itemBuilder: (BuildContext context, int index) {
                return QuestionItem(question: questions[index]);
              },
            );
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: questions.length,
              itemBuilder: (BuildContext context, int index) {
                return QuestionItem(question: questions[index]);
              },
            );
          }
          /* 2nd approach:
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            for (Question question in questions) QuestionItem(question: question),
          ],
        ),
      )*/
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
