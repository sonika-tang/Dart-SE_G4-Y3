import 'package:flutter/material.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/model/quiz.dart';
import 'package:flutter_practice/W9%20-%20Practice/lib/ui/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onStartQuiz;

  const WelcomeScreen({
    super.key,
    required this.quiz,
    required this.onStartQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset('assets/images/quiz-logo.png'),
              const Spacer(),
              AppButton(
                'Start Quiz',
                icon: Icons.play_arrow,
                onTap: onStartQuiz,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
