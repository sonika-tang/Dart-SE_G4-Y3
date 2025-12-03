import 'package:flutter/material.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/model/quiz.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/model/quiz_result.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/ui/widgets/app_button.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/ui/widgets/result_summary_item.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final QuizResult result;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.quiz,
    required this.result,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final score = result.getScore(quiz);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'You answered $score on ${quiz.questions.length}!',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ...List.generate(
                  quiz.questions.length,
                  (index) => ResultSummaryItem(
                    questionIndex: index + 1,
                    question: quiz.questions[index].title,
                    selectedAnswer: result.answers[index],
                    correctAnswer: quiz.questions[index].correctAnswerIndex,
                    options: quiz.questions[index].options,
                  ),
                ),
                const SizedBox(height: 32),
                AppButton(
                  'Restart Quiz',
                  icon: Icons.refresh,
                  onTap: onRestart,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}