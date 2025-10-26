import 'package:flutter/material.dart';

// Ex4
void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomCard(text: 'OOP', color: Colors.blue.shade100),
            CustomCard(text: 'DART', color: Colors.blue.shade300),
            CustomCard(
              text: 'FLUTTER',
              gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.blue.shade900],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;
  final Gradient? gradient;

  const CustomCard({
    super.key,
    required this.text,
    this.color = Colors.blue,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
        gradient: gradient,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
