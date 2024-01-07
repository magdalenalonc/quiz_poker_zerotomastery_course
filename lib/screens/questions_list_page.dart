import 'dart:math';

import 'package:flutter/material.dart';

import '../data/questions_list.dart';
import '../models/question.dart';
import '../widgets/question_item.dart';
import 'question_detail_page.dart';

class QuestionsListPage extends StatefulWidget {
  const QuestionsListPage({super.key});

  @override
  State<QuestionsListPage> createState() => _QuestionsListPageState();
}

class _QuestionsListPageState extends State<QuestionsListPage> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: _goToRandomQuestionDetail,
        splashColor: Theme.of(context).colorScheme.secondary,
        tooltip: "Random question",
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}
