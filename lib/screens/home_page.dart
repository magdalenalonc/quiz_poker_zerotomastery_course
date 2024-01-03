import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_poker_zerotomastery_course/screens/question_detail_page.dart';

import '../data/questions_list.dart';
import '../models/question.dart';
import '../widgets/question_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*void _addQuestion() {
    setState(() {
      questions.add(
        Question(
          category: Category.other,
          questionText: 'New Question Text',
          hint1: 'Hint 1: New Hint',
          hint2: 'Hint 2: Another Hint',
          solution: 'Solution: New Solution',
        ),
      );
    });
  }*/

  void _goToQuestionDetail(Question question) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionDetailPage(question: question),
      ),
    );
  }

  void _goToRandomQuestionDetail() {
    if (questions.isNotEmpty) {
      Random random = Random();
      int randomIndex = random.nextInt(questions.length);
      _goToQuestionDetail(questions[randomIndex]);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscapeMode =
        MediaQuery.of(context).size.width >= MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Poker"),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: isLandscapeMode ? Axis.horizontal : Axis.vertical,
        itemCount: questions.length,
        itemBuilder: (BuildContext context, int index) {
          return QuestionItem(
            question: questions[index],
            onTap: () => _goToQuestionDetail(questions[index]),
          );
        },
      ),
      /* Other approach:
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  for (Question question in questions) QuestionItem(question: question),
                ],
              ),
            )*/
      floatingActionButton: FloatingActionButton(
        onPressed: _goToRandomQuestionDetail,
        splashColor: Theme.of(context).colorScheme.secondary,
        tooltip: "Random question",
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}
