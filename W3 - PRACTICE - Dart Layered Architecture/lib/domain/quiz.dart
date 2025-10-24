import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point;

  Question({
    String? id,
    required this.title,
    required this.choices,
    required this.goodChoice,
    this.point = 1,
  }) : id = id ?? uuid.v4();

  int get points => point;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'choices': choices,
      'goodChoice': goodChoice,
      'points': point,
    };
  }
}

class Answer {
  final String questionId;
  final String answerChoice;

  Answer({required this.questionId, required this.answerChoice});

  bool isGood(Quiz quiz) {
    final question = quiz.getQuestionById(questionId);
    return question != null && answerChoice == question.goodChoice;
  }

  int getPoint(Quiz quiz) {
    final question = quiz.getQuestionById(questionId);
    return isGood(quiz) ? (question?.point ?? 0) : 0;
  }
}

class Player {
  final String name;
  final List<Answer> answers = [];

  Player(this.name);

  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  void clearAnswers() {
    answers.clear();
  }

  int getScoreInPoint(Quiz quiz) {
    return answers.fold(0, (sum, a) => sum + a.getPoint(quiz));
  }

  int getScoreInPercentage(Quiz quiz) {
    final maxScore = quiz.getMaxScore();
    return maxScore == 0
        ? 0
        : ((getScoreInPoint(quiz) / maxScore) * 100).toInt();
  }
}

class Quiz {
  final String id;
  final List<Question> questions;
  final Map<String, Player> players = {};

  Quiz({String? id, required this.questions}) : id = id ?? uuid.v4();

  int getMaxScore() {
    return questions.fold(0, (sum, q) => sum + q.point);
  }

  /// Records answers for a player
  void playerAnswers(String playerName, List<Answer> answers) {
    final player = players[playerName] ?? Player(playerName);
    player.clearAnswers();
    for (var answer in answers) {
      player.addAnswer(answer);
    }
    players[playerName] = player;
  }

  Player? getPlayer(String name) => players[name];

  List<Player> getAllPlayers() => players.values.toList();

  Question? getQuestionById(String id) {
    try {
      return questions.firstWhere((q) => q.id == id);
    } catch (_) {
      return null;
    }
  }
}
