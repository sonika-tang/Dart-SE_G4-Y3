import 'dart:io';
import '../domain/quiz.dart';

class QuizConsole {
  final Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');

    while (true) {
      stdout.write('Your name: ');
      String? name = stdin.readLineSync();

      if (name == null || name.isEmpty) {
        print('--- Quiz Finished ---');
        break;
      }

      Player player = Player(name);
      print('');

      for (var question in quiz.questions) {
        print('Question: ${question.title} - ( ${question.point} points )');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? input = stdin.readLineSync();

        if (input != null && input.isNotEmpty) {
          player.addAnswer(Answer(
            questionId: question.id,
            answerChoice: input,
          ));
        } else {
          print('No answer provided.');
        }

        print('');
      }

      quiz.playerAnswers(name, player.answers);

      int scorePoint = player.getScoreInPoint(quiz);
      int scorePercentage = player.getScoreInPercentage(quiz);

      print('${player.name}, your score in percentage: $scorePercentage %');
      print('${player.name}, your score in points: $scorePoint %\n');

      for (var p in quiz.getAllPlayers()) {
        print('Player: ${p.name}\t\tScore:${p.getScoreInPercentage(quiz)}');
      }

      print('');
    }
  }
}
