import 'package:flutter/material.dart';
import 'package:quiz_poker_zerotomastery_course/models/question.dart';

import '../data/questions_list.dart';
import '../widgets/question_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _addQuestion() {
    setState(() {
      questions.add(
        Question(
          category: Category.other,
          questionText: 'New Question Text',
        ),
      );
    });
  }

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
          /* Other approach:
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
        onPressed: _addQuestion,
        splashColor: Theme.of(context).colorScheme.secondary,
        tooltip: "Add question",
        child: const Icon(Icons.add_box_rounded),
      ),
    );
  }
}
