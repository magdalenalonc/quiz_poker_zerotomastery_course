import 'package:flutter/material.dart';

import '../data/questions_list.dart';
import '../models/question.dart';

class QuestionFormPage extends StatefulWidget {
  const QuestionFormPage({super.key});

  @override
  State<QuestionFormPage> createState() => _QuestionFormPageState();
}

class _QuestionFormPageState extends State<QuestionFormPage> {
  final TextEditingController questionTextController = TextEditingController();
  final TextEditingController hint1Controller = TextEditingController();
  final TextEditingController hint2Controller = TextEditingController();
  final TextEditingController solutionController = TextEditingController();
  Category selectedOption = Category.sport;

  Widget _categoryDropdownButton() {
    return DropdownButton<Category>(
      value: selectedOption,
      onChanged: (Category? newValue) {
        setState(() {
          selectedOption = newValue!;
        });
      },
      items: Category.values.map<DropdownMenuItem<Category>>(
        (Category value) {
          return DropdownMenuItem<Category>(
            value: value,
            child: Text(value.name.toString().toUpperCase()),
          );
        },
      ).toList(),
    );
  }

  void _submitForm() {
    Category category = selectedOption;
    String questionText = questionTextController.text;
    String hint1 = hint1Controller.text;
    String hint2 = hint2Controller.text;
    String solution = solutionController.text;

    // Add a new question to the list
    if (questionText.isNotEmpty &&
        hint1.isNotEmpty &&
        hint2.isNotEmpty &&
        solution.isNotEmpty) {
      Question newQuestion = Question(
        category: category,
        questionText: questionText,
        hint1: hint1,
        hint2: hint2,
        solution: solution,
      );

      // Update the state to reflect the new question
      questions.add(newQuestion);
      Navigator.pushNamed(context, '/homePage');
    } else {
      _showSnackBar('Please fill out all fields');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category'),
            const SizedBox(height: 16.0),
            _categoryDropdownButton(),
            TextField(
              controller: questionTextController,
              decoration: const InputDecoration(labelText: 'Question Text'),
            ),
            TextField(
              controller: hint1Controller,
              decoration: const InputDecoration(labelText: 'Hint 1'),
            ),
            TextField(
              controller: hint2Controller,
              decoration: const InputDecoration(labelText: 'Hint 2'),
            ),
            TextField(
              controller: solutionController,
              decoration: const InputDecoration(labelText: 'Solution'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
