import 'package:flutter/material.dart';

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