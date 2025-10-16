class Answer {
  String answerChoice;
  bool isGoodAnswer;
  
  Answer({required this.answerChoice, required this.isGoodAnswer});
}

class Question{
  String title;
  List<String> choices;
  String goodChoice;

  Question({
    required this.title,
    required this.choices,
    required this.goodChoice,
  });

  bool isCorrect(String choice) {
    return choice == goodChoice;
  }
}

class Quiz{
  List<Question> questions = [];
  List<Answer> answers = [];

  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  int getScore() {
    int score = 0;
    for (var answer in answers) {
      if (answer.isGoodAnswer) {
        score++;
      }
    }
    return score;
  }
}
