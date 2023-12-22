enum Category { sport, music, movie, animals }

class Question {
  Question({required this.category, required this.questionText});

  final Category category;
  final String questionText;
}
