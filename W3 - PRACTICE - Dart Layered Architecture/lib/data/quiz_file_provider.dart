import 'dart:convert';
import 'dart:io';
import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  Quiz readQuiz() {
    final file = File(filePath);
    if (!file.existsSync()) throw Exception('Quiz file not found.');

    final content = file.readAsStringSync();
    final data = jsonDecode(content);

    var questionsJson = data['questions'] as List;
    var questions = questionsJson.map((q) {
      return Question(
        id: q['id'],
        title: q['title'],
        choices: List<String>.from(q['choices']),
        goodChoice: q['goodChoice'],
        point: q['points'] ?? 1,
      );
    }).toList();

    return Quiz(id: data['id'], questions: questions);
  }

  void writeQuiz(Quiz quiz) {
    final data = {
      'id': quiz.id,
      'questions': quiz.questions.map((q) => q.toJson()).toList(),
    };

    final file = File(filePath);
    file.writeAsStringSync(jsonEncode(data));
  }
}
