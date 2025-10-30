import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Center(
        child: Column(
          children: [
            MyGradient(text: 'Hello1', start: Colors.blue, end: Colors.red),
            MyGradient(text: 'Hello2', start: Colors.blue, end: Colors.red),
            MyGradient(text: 'Hello3', start: Colors.blue, end: Colors.red),
          ],
        ),
      ),
    ),
  );
}

class MyGradient extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;

  const MyGradient({super.key, required this.text, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(colors: [start, end])
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 35,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
