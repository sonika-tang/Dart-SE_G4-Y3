class Question {
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int queScore; //Ex2

  Question(
      {required this.title,
      required this.choices,
      required this.goodChoice,
      this.queScore = 1});
}

class Answer {
  final Question question;
  final String answerChoice;

  Answer({required this.question, required this.answerChoice});

  bool isGood() {
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz {
  List<Question> questions;
  List<Answer> answers = [];
  int index = 0;

  Quiz({required this.questions});

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
  final Player player;
  final Quiz quiz;
  final int scorePoint;
  final int scorePercentage;

  Submission(
      {required this.player,
      required this.quiz,
      required this.scorePoint,
      required this.scorePercentage});
}

class Player {
  final String name;
  Submission? lastSubmission;

  Player(this.name);
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
