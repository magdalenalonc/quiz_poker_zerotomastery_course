enum Category { sport, music, movie, animals, other }

class Question {
  Question({
    required this.category,
    required this.questionText,
    required this.hint1,
    required this.hint2,
    required this.solution,
  });

  final Category category;
  final String questionText;
  final String hint1;
  final String hint2;
  final String solution;
}
