import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'question_form_page.dart';
import 'questions_list_page.dart';

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
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          QuestionsListPage(),
          QuestionFormPage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
