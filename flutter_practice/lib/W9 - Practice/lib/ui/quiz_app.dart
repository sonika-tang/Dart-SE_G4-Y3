import 'package:flutter/material.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/data/data.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/model/quiz.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/model/quiz_result.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/ui/screens/question_screen.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/ui/screens/result_screen.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/ui/screens/welcome_screen.dart';

enum ScreenType { welcome, question, result }

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late Quiz quiz;
  ScreenType currentScreen = ScreenType.welcome;
  int currentQuestionIndex = 0;
  late QuizResult currentResult;

  @override
  void initState() {
    super.initState();
    quiz = QuizMockRepository.getQuiz();
    currentResult = QuizResult(
      quizId: quiz.id,
      answers: List<int?>.filled(quiz.questions.length, null),
      timestamp: DateTime.now(),
    );
  }

  void _onStartQuiz() {
    setState(() {
      currentScreen = ScreenType.question;
      currentQuestionIndex = 0;
      currentResult = QuizResult(
        quizId: quiz.id,
        answers: List<int?>.filled(quiz.questions.length, null),
        timestamp: DateTime.now(),
      );
    });
  }

  void _onAnswerSelected(int answerIndex) {
    currentResult.answers[currentQuestionIndex] = answerIndex;

    if (currentQuestionIndex < quiz.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      setState(() {
        currentScreen = ScreenType.result;
      });
    }
  }

  void _onRestart() {
    setState(() {
      currentScreen = ScreenType.welcome;
      currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
          centerTitle: true,
        ),
        body: _getCurrentScreen(),
      ),
    );
  }

  Widget _getCurrentScreen() {
    switch (currentScreen) {
      case ScreenType.welcome:
        return WelcomeScreen(
          quiz: quiz,
          onStartQuiz: _onStartQuiz,
        );
      case ScreenType.question:
        return QuestionScreen(
          quiz: quiz,
          currentQuestionIndex: currentQuestionIndex,
          selectedAnswer: currentResult.answers[currentQuestionIndex],
          onAnswerSelected: _onAnswerSelected,
        );
      case ScreenType.result:
        return ResultScreen(
          quiz: quiz,
          result: currentResult,
          onRestart: _onRestart,
        );
    }
  }
}
