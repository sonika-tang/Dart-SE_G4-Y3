import 'package:test/test.dart';
import 'package:my_first_project/domain/quiz.dart';

void main() {
  Question q1 = Question(
      title: "2+2", choices: ["1", "2", "4"], goodChoice: "4", point: 10);
  Question q2 = Question(
      title: "2+3", choices: ["1", "2", "5"], goodChoice: "5", point: 20);

  Quiz quiz = Quiz(questions: [q1, q2]);

  test('All answers correct (100%)', () {
    quiz.playerAnswers('Nika', [
      Answer(questionId: q1.id, answerChoice: "4"),
      Answer(questionId: q2.id, answerChoice: "5"),
    ]);

    final player = quiz.getPlayer('Nika');
    expect(player?.getScoreInPercentage(quiz), equals(100));
  });

  test('Half answers correct (50%)', () {
    quiz.playerAnswers('Sovannita', [
      Answer(questionId: q1.id, answerChoice: "4"),
      Answer(questionId: q2.id, answerChoice: "1"),
    ]);

    final player = quiz.getPlayer('Sovannita');
    expect(player?.getScoreInPercentage(quiz), equals(33));
  });

  test('All answers wrong (0%)', () {
    quiz.playerAnswers('Lin', [
      Answer(questionId: q1.id, answerChoice: "5"),
      Answer(questionId: q2.id, answerChoice: "2"),
    ]);

    final player = quiz.getPlayer('Lin');
    expect(player?.getScoreInPercentage(quiz), equals(0));
  });
}
