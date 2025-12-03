import 'package:flutter/material.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/model/quiz.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/model/quiz_result.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/ui/widgets/app_button.dart';

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
 

class ResultSummaryItem extends StatelessWidget {
  final int questionIndex;
  final String question;
  final int? selectedAnswer;
  final int correctAnswer;
  final List<String> options;

  const ResultSummaryItem({
    super.key,
    required this.questionIndex,
    required this.question,
    required this.selectedAnswer,
    required this.correctAnswer,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    final isCorrect = selectedAnswer == correctAnswer;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: isCorrect ? Colors.green : Colors.red,
                child: Text(
                  '$questionIndex',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  question,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            selectedAnswer != null ? options[selectedAnswer!] : 'Not answered',
            style: TextStyle(
              color: Colors.white,
              fontWeight: isCorrect ? FontWeight.normal : FontWeight.bold,
            ),
          ),
          if (isCorrect)
            Text(
              '✓ ${options[correctAnswer]}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          else ...[
            Text(
              options[selectedAnswer!],
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 4),
            Text(
              '✓ ${options[correctAnswer]}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}