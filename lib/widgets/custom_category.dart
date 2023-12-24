import 'package:flutter/material.dart';

import '../models/question.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key, required this.category});

  final Category category;

  String _getImagePath(String categoryName) {
    return 'assets/images/$categoryName.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 22.0,
          backgroundImage: AssetImage(
            _getImagePath(category.name),
          ),
        ),
        const SizedBox.square(dimension: 16.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              category.name.toUpperCase(),
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
