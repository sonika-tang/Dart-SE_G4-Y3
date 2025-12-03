import 'package:flutter_practice/W9%20-%20Practice/lib/model/question.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/model/quiz.dart';

class QuizMockRepository {
  static getQuiz() {
    return Quiz(
      id: 'q1',
      title: 'Flutter Basics',
      questions: [
        Question(
          id: 'q1',
          title: 'What is Flutter?',
          options: [
            'A web framework',
            'A mobile app framework by Google',
            'A programming language',
            'A database'
          ],
          correctAnswerIndex: 1,
        ),
        Question(
          id: 'q2',
          title: 'Which language is used in Flutter?',
          options: ['JavaScript', 'Python', 'Dart', 'Kotlin'],
          correctAnswerIndex: 2,
        ),
        Question(
          id: 'q3',
          title: 'What is a StatelessWidget?',
          options: [
            'A widget that cannot be built',
            'A widget with mutable state',
            'An immutable widget',
            'A widget for navigation'
          ],
          correctAnswerIndex: 2,
        ),
      ],
    );
  }
}