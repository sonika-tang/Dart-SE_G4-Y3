import 'package:flutter/material.dart';

// Ex2
void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: Colors.blue.shade300,
        margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue.shade600,
          ),
          child: Center(
            child: Text(
              'CADT STUDENTS',
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}