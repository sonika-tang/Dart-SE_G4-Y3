import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(backgroundColor: Color(0xFFB8E986), body: ScoreBarPage()),
  ),
);

class ScoreBarPage extends StatelessWidget {
  const ScoreBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        ScoreCard(title: 'My score in Flutter', initialScore: 6),
        SizedBox(height: 20),
        ScoreCard(title: 'My score in Dart', initialScore: 2),
        SizedBox(height: 20),
        ScoreCard(title: 'My score in React', initialScore: 10),
      ],
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String title;
  final int initialScore;

  const ScoreCard({super.key, required this.title, required this.initialScore});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late int score;

  @override
  void initState() {
    super.initState();
    score = widget.initialScore;
  }

  void _increment() {
    setState(() {
      if (score < 10) score++;
    });
  }

  void _decrement() {
    setState(() {
      if (score > 0) score--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(height: 20),
          // Progress bar
          Stack(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              // Filled bar
              Container(
                height: 40,
                width: (score / 10) * (MediaQuery.of(context).size.width - 80),
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: _decrement,
                child: Text(
                  '-',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Text(
                '$score/10',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              GestureDetector(
                onTap: _increment,
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
