import 'package:flutter/material.dart';

import '../models/question.dart';
import 'display_horizontal.dart';
import 'display_vertical.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({
    super.key,
    required this.question,
    required this.onTap,
  });

  final Question question;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber,
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < constraints.maxHeight) {
            return DisplayVerticalScreen(question: question);
          } else {
            return DisplayHorizontalScreen(question: question);
          }
        },
      ),
    );
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
