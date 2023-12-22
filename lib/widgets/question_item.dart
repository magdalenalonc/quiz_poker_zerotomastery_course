import 'package:flutter/material.dart';

import '../models/question.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    // 1st approach:
    //  return Card(
    //   margin: const EdgeInsets.all(10.0),
    //   child: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text('Category: ${question.category}'),
    //         const SizedBox.square(dimension: 12.0),
    //         Text('Question: ${question.questionText}'),
    //       ],
    //     ),
    //   ),
    // );

    // 2nd approach:
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withOpacity(0.6),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                question.category.name.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox.square(dimension: 12.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Question:',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              const SizedBox.square(dimension: 12.0),
              Expanded(
                child: Text(
                  question.questionText,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
