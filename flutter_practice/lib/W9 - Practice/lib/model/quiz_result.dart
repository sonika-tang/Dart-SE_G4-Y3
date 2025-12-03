import 'package:flutter_practice/W9%20-%20Practice/lib/model/quiz.dart';

class QuizResult {
  final String quizId;
  // final String playerName;
  final List<int?> answers;
  final DateTime timestamp;

  QuizResult({
    required this.quizId,
    // required this.playerName,
    required this.answers,
    required this.timestamp,
  });

  int getScore(Quiz quiz) {
    int score = 0;
    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == quiz.questions[i].correctAnswerIndex) {
        score++;
      }
    }
    return score;
  }

  factory QuizResult.fromJson(Map<String, dynamic> json) {
    return QuizResult(
      quizId: json['quizId'],
      // playerName: json['playerName'],
      answers: (json['answers'] as List).cast<int?>(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quizId': quizId,
      // 'playerName': playerName,
      'answers': answers,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}