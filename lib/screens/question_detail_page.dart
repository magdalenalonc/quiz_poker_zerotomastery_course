import 'package:flutter/material.dart';

import '../models/question.dart';

class QuestionDetailPage extends StatefulWidget {
  const QuestionDetailPage({super.key, required this.question});

  final Question question;

  @override
  State<QuestionDetailPage> createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage> {
  @override
  Widget build(BuildContext context) {
    int actionCount = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Question Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Category: ${widget.question.category}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox.square(dimension: 12.0),
            Text('Question: ${widget.question.questionText}'),
            const SizedBox.square(dimension: 18.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  actionCount++;
                });
                _showHint(actionCount);
              },
              child: Text('See hint/solution ($actionCount)'),
            ),
          ],
        ),
      ),
    );
  }

  void _showHint(int actionCount) {
    if (actionCount == 1) {
      _showSnackBar(widget.question.hint1);
    } else if (actionCount == 2) {
      _showSnackBar(widget.question.hint2);
    } else if (actionCount == 3) {
      _showSnackBar(widget.question.solution);
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
