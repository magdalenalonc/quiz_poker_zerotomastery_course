import 'package:flutter/material.dart';

import '../models/question.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key, required this.question});

  final Question question;

  String getImagePath(String categoryName) {
    return 'assets/images/$categoryName.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage(
            getImagePath(question.category.name),
          ),
        ),
        const SizedBox.square(dimension: 20.0),
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
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
