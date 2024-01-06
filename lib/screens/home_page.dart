import 'dart:io' show Platform;
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_poker_zerotomastery_course/screens/question_detail_page.dart';

import '../data/questions_list.dart';
import '../models/question.dart';
import '../widgets/question_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  /*void _addQuestion() {
    setState(() {
      questions.add(
        Question(
          category: Category.other,
          questionText: 'New Question Text',
          hint1: 'Hint 1: New Hint',
          hint2: 'Hint 2: Another Hint',
          solution: 'Solution: New Solution',
        ),
      );
    });
  }*/

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBottomNavigationBar() {
    if (kIsWeb) {
      return NavigationBar(
        indicatorColor: Theme.of(context).colorScheme.primary,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Questions List',
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'Add Question',
          ),
        ],
      );
    } else {
      return BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Questions List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Question',
          ),
        ],
      );
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
      /* Other approach:
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  for (Question question in questions) QuestionItem(question: question),
                ],
              ),
            )*/
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToRandomQuestionDetail,
        splashColor: Theme.of(context).colorScheme.secondary,
        tooltip: "Random question",
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}
