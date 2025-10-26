import 'package:flutter/material.dart';

// Ex3
void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[100],
              ),
              child: Center(
                child: Text(
                  'OOP',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[300],
              ),
              child: Center(
                child: Text(
                  'DART',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.blue[600],
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade300,
                    Colors.blue.shade600,
                    Colors.blue.shade900,
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  'FLUTTER',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}