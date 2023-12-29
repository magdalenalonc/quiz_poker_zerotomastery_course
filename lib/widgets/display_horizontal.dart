import 'package:flutter/material.dart';

import '../models/question.dart';
import 'custom_category.dart';

class DisplayHorizontalScreen extends StatelessWidget {
  const DisplayHorizontalScreen({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: const EdgeInsets.all(14.0),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCategory(category: question.category),
          const SizedBox.square(dimension: 16.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Question:',
                style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
              ),
              const SizedBox.square(dimension: 16.0),
              Expanded(
                child: Text(
                  question.questionText,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}