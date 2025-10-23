import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;
  final Game game = Game();

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');

    // for (var question in quiz.questions) {
    //   print('Question: ${question.title} - (${question.queScore} points)');
    //   print('Choices: ${question.choices}');
    //   stdout.write('Your answer: ');
    //   String? userInput = stdin.readLineSync();

    //   // Check for null input
    //   if (userInput != null && userInput.isNotEmpty) {
    //     Answer answer = Answer(question: question, answerChoice: userInput);
    //     quiz.addAnswer(answer);
    //   } else {
    //     print('No answer entered. Skipping question.');
    //   }

    //   print('');
    // }

    while (true) {
      stdout.write('Your name: ');
      String? name = stdin.readLineSync();
      if (name == null || name.isEmpty) {
        print("Quiz finish");
        break;
      }

      Player player = Player(name);
      Quiz playerQuiz = Quiz(questions: quiz.questions);

      //Run quiz for this player
      for (var question in playerQuiz.questions) {
        print('Question: ${question.title} - (${question.queScore} points)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(question: question, answerChoice: userInput);
          playerQuiz.addAnswer(answer);
        } else {
          print("No answer!! Skipping question");
        }
        print('');
      }

      int scorePoints = playerQuiz.getScoreInPoint();
      int scorePercent = playerQuiz.getScoreInPercentage();

      // Create a submission and save it
      Submission submission = Submission(
        player: player,
        quiz: playerQuiz,
        scorePoint: scorePoints,
        scorePercentage: scorePercent,
      );

      game.addSubmission(player, submission);

      // Show result
      print('$name, your score in percentage: $scorePercent %');
      print('$name, your score in points: $scorePoints\n');

      // Show scoreboard
      print('--- Player Scores ---');
      for (var p in game.players) {
        print('Player: ${p.name}, Score: ${p.lastSubmission?.scorePoint}');
      }
      print('');
    }

    // int scorePoint = quiz.getScoreInPoint();
    // int scorePercentage = quiz.getScoreInPercentage();
    // print('--- Quiz Finished ---');
    // print('Your score in percentage: $scorePercentage %');
    // print('Your score in points: $scorePoint');
  }
}
