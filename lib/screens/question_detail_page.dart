import 'package:flutter/material.dart';

import '../models/question.dart';

class QuestionDetailPage extends StatefulWidget {
  const QuestionDetailPage({super.key, required this.question});

  final Question question;

  @override
  State<QuestionDetailPage> createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage> {
  int actionCount = 0;

  void _showHint(int actionCount) {
    if (actionCount == 1) {
      _opemAnimatedDialog(widget.question.hint1);
    } else if (actionCount == 2) {
      _opemAnimatedDialog(widget.question.hint2);
    } else if (actionCount == 3) {
      _opemAnimatedDialog(widget.question.solution);
    } else if (actionCount > 3) {
      Navigator.of(context).pop();
    }
  }

  void _opemAnimatedDialog(String message) {
    showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (context, a1, a2, widget) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
          child: AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              "Catch a hint or solution!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(
              message,
              style: const TextStyle(fontSize: 18.0),
            ),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(width: 1.5),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Question Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Category: ${widget.question.category.name.toUpperCase()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                    ),
                  ),
                ),
              ),
              const SizedBox.square(dimension: 18.0),
              Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Question: ${widget.question.questionText}',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              const SizedBox.square(dimension: 50.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.green),
                ),
                onPressed: () {
                  setState(() {
                    actionCount++;
                  });
                  _showHint(actionCount);
                },
                child: Text(
                  'See hint/solution ($actionCount)',
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
