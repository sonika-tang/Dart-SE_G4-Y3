import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

List<Text> texts() {
  return colors.map((item) => Text(item)).toList();
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Label("Method 1: Loop in Array", bold: true),
              for (int i = 0; i < colors.length; i++) Text(colors[i]),
              // TODO
              Label("Method 2: Map", bold: true),
              // TODO
              ...colors.map((item) => Text(item)),
              Label("Method 23: Dedicated Function", bold: true),
              // TODO
              ...texts(),
            ],
          ),
        ),
      ),
    ),
  );
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
