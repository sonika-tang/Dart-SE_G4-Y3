import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int queScore; //Ex2

  Question(
      {String? id,
      required this.title,
      required this.choices,
      required this.goodChoice,
      this.queScore = 1})
      : id = id ?? uuid.v4();
}

class Answer {
  final String id;
  final Question question;
  final String answerChoice;

  Answer({String? id, required this.question, required this.answerChoice, required String questionId})
      : id = id ?? uuid.v4();

  bool isGood() {
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz {
  final String id;
  List<Question> questions;
  List<Answer> answers = [];
  int index = 0;

  Quiz({String? id, required this.questions}) : id = id ?? uuid.v4();

  void addAnswer(Answer asnwer) {
    this.answers.add(asnwer);
  }

  Question get currentQuestion => questions[index]; //Ex2

  int getScoreInPoint() {
    //Ex2
    int totalSCore = 0;

    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalSCore += answer.question.queScore;
      }
    }
    return totalSCore;
  }

  int getScoreInPercentage() {
    int totalScore = getScoreInPoint();
    int maxScore = questions.fold(0, (sum, q) => sum + q.queScore);
    return ((totalScore / maxScore) * 100).toInt();
  }
}

///EX3 implementation
class Submission {
  final String id;
  // final Player player;
  // final Quiz quiz;
  final String playerId;
  final String quizId;
  final int scorePoint;
  final int scorePercentage;

  Submission(
      {String? id,
      // required this.player,
      // required this.quiz,
      required this.quizId,
      required this.playerId,
      required this.scorePoint,
      required this.scorePercentage, required Player player, required Quiz quiz})
      : id = id ?? uuid.v4();
}

class Player {
  final String id;
  final String name;
  Submission? lastSubmission;

  Player(this.name, {String? id}) : id = id ?? uuid.v4();
}

class Game {
  final List<Player> players = [];

  /// Add or update a submission for a player
  void addSubmission(Player player, Submission submission) {
    Player? existing = players.firstWhere((p) => p.name == player.name,
        orElse: () => Player(""));

    if (existing.name.isNotEmpty) {
      existing.lastSubmission = submission;
    } else {
      player.lastSubmission = submission;
      players.add(player);
    }
  }
}
