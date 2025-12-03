import 'package:flutter/material.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/model/quiz.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/ui/widgets/question_option_button.dart';
 
class QuestionScreen extends StatelessWidget {
  final Quiz quiz;
  final int currentQuestionIndex;
  final int? selectedAnswer;
  final Function(int) onAnswerSelected;

  const QuestionScreen({
    super.key,
    required this.quiz,
    required this.currentQuestionIndex,
    required this.selectedAnswer,
    required this.onAnswerSelected,
  });

 @override
  Widget build(BuildContext context) {
    final question = quiz.questions[currentQuestionIndex];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                question.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ...List.generate(
                question.options.length,
                (index) => QuestionOptionButton(
                  option: question.options[index],
                  isSelected: selectedAnswer == index,
                  onTap: () => onAnswerSelected(index),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}