import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 100),
            Container(color: Colors.blue, height: 400),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.green)),
                  Container(color: Colors.pink, width: 100),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.yellow)),
                  SizedBox(width: 20),
                  Expanded(child: Container(color: Colors.yellow)),
                  SizedBox(width: 20),
                  Expanded(child: Container(color: Colors.yellow)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(child: Container(color: Colors.pink)),
          ],
        ),
      ),
    ),
  );
}
