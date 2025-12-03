import 'package:flutter/material.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/model/quiz.dart';
 
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
 

 class QuestionOptionButton extends StatelessWidget {
  final String option;
  final bool isSelected;
  final VoidCallback onTap;

  const QuestionOptionButton({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: isSelected
              ? Border.all(color: Colors.amber, width: 3)
              : Border.all(color: Colors.white, width: 0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          option,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.amber : Colors.grey[700],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}