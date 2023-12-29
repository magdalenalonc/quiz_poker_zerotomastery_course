import 'package:flutter/material.dart';

import '../models/question.dart';
import 'display_horizontal.dart';
import 'display_vertical.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width >= 600;

    if (isLargeScreen) {
      return DisplayHorizontalScreen(question: question);
    } else {
      return DisplayVerticalScreen(question: question);
    }
  }

  /*Other approach:
     return Card(
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category: ${question.category}'),
            const SizedBox.square(dimension: 12.0),
            Text('Question: ${question.questionText}'),
          ],
        ),
      ),
    );*/
}
