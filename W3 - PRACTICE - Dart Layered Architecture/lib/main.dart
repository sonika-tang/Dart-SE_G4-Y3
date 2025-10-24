
import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quiz_file_provider.dart';

void main() {

  QuizRepository repo = QuizRepository('/Users/nika/Computer_Science/Term1-Year3/Flutter/Lab_Practice/Dart-SE_G4-Y3/W3 - PRACTICE - Dart Layered Architecture/lib/data/quiz.json');

  Quiz quiz = repo.readQuiz();

  QuizConsole console = QuizConsole(quiz: quiz);

  console.startQuiz();
}