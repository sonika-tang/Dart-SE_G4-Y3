import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';
import 'package:my_first_project/data/quiz_file_provider.dart';

main() {
  // Create 2 questions and the quiz
  Question q1 =
      Question(title: "2+2", choices: ["1", "2", "4"], goodChoice: "4");

  Question q2 =
      Question(title: "2+3", choices: ["1", "2", "5"], goodChoice: "5");

  Question q3 = Question(
      title: "2-1", choices: ["1", "2", "5"], goodChoice: "1", queScore: 10);

  Question q4 = Question(
      title: "2*5",
      choices: ["10", "20", "15"],
      goodChoice: "10",
      queScore: 50);

  Quiz quiz = Quiz(questions: [q1, q2]);
  Quiz quiz2 = Quiz(questions: [q3, q4]);
  Game game = Game();

  test('All answers are good (100%)', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "4", questionId: '');
    Answer a2 = Answer(question: q2, answerChoice: "5", questionId: '');

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(100));
  });

  test('Answers are 50% correct', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "2", questionId: '');
    Answer a2 = Answer(question: q2, answerChoice: "5", questionId: '');

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(50));
  });

  test('Answers are 0% correct', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "2", questionId: '');
    Answer a2 = Answer(question: q2, answerChoice: "1", questionId: '');

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(0));
  });

// Test with quiz that have answer
  test('All answers are good 100% and full points (for quiz that have point)',
      () {
    Answer a1 = Answer(question: q3, answerChoice: "1", questionId: '');
    Answer a2 = Answer(question: q4, answerChoice: "10", questionId: '');
    quiz2.answers = [a1, a2];

    expect(quiz2.getScoreInPoint(), equals(60));
    expect(quiz2.getScoreInPercentage(), equals(100));
  });

// Test with multiple player
    test('Player score is saved', () {
    Player p1 = Player("Nika");
    quiz.answers = [
      Answer(question: q3, answerChoice: "1", questionId: ''),
      Answer(question: q4, answerChoice: "10", questionId: ''),
    ];

    Submission s1 = Submission(
      player: p1,
      quiz: quiz2,
      scorePoint: quiz2.getScoreInPoint(),
      scorePercentage: quiz2.getScoreInPercentage(), quizId: '', playerId: '',
    );

    game.addSubmission(p1, s1);

    expect(game.players.length, equals(1));
    expect(game.players.first.lastSubmission?.scorePoint, equals(60));
    expect(game.players.first.lastSubmission?.scorePercentage, equals(100));
  });

  test('Player score is overwritten if they play again', () {
    Player p1 = Player("Nika");

    // First attempt: correct one (10 points)
    quiz.answers = [
      Answer(question: q3, answerChoice: "1", questionId: ''),
      Answer(question: q4, answerChoice: "20", questionId: ''),
    ];
    Submission s1 = Submission(
      player: p1,
      quiz: quiz2,
      scorePoint: quiz2.getScoreInPoint(),
      scorePercentage: quiz2.getScoreInPercentage(), quizId: '', playerId: '',
    );
    game.addSubmission(p1, s1);

    // Second attempt: all wrong
    Quiz quiz3 = Quiz(questions: [q3, q4]);
    quiz2.answers = [
      Answer(question: q3, answerChoice: "2", questionId: ''),
      Answer(question: q4, answerChoice: "20", questionId: ''),
    ];
    Submission s2 = Submission(
      player: p1,
      quiz: quiz3,
      scorePoint: quiz3.getScoreInPoint(),
      scorePercentage: quiz3.getScoreInPercentage(), quizId: '', playerId: '',
    );
    game.addSubmission(p1, s2);

    // Check overwrite
    expect(game.players.length, equals(1)); // still one player
    expect(game.players.first.lastSubmission?.scorePoint, equals(0));
    expect(game.players.first.lastSubmission?.scorePercentage, equals(0));
  });

  // Ex4 test case
  test('QuizRepository can read and write JSON', () {
    final repo = QuizRepository('/Users/nika/Computer_Science/Term1-Year3/Flutter/Lab_Practice/Dart-SE_G4-Y3/W3 - PRACTICE - Dart Layered Architecture/lib/data/quiz.json');

    Question q1 = Question(
        title: "Capital of France?",
        choices: ["Paris", "London", "Rome"],
        goodChoice: "Paris",
        queScore: 10);

    Quiz quiz = Quiz(questions: [q1]);

    repo.writeQuiz(quiz);

    Quiz loaded = repo.readQuiz();

    expect(loaded.questions.first.title, equals("Capital of France?"));
  });
}
