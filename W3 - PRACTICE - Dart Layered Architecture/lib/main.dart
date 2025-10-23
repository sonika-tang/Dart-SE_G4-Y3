
import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quiz_file_provider.dart';

void main() {

  // List<Question> questions = [
  //   Question(
  //       title: "Capital of France?",
  //       choices: ["Paris", "London", "Rome"],
  //       goodChoice: "Paris",
  //       queScore: 10),
  //   Question(
  //       title: "2 + 2 = ?", 
  //       choices: ["2", "4", "5"], 
  //       goodChoice: "4",
  //       queScore: 50),
  // ];

  QuizRepository repo = QuizRepository('/Users/nika/Computer_Science/Term1-Year3/Flutter/Lab_Practice/Dart-SE_G4-Y3/W3 - PRACTICE - Dart Layered Architecture/lib/data/quiz.json');

  Quiz quiz = repo.readQuiz();

  // Quiz quiz = Quiz(questions: questions);
  QuizConsole console = QuizConsole(quiz: quiz);

  console.startQuiz();
}