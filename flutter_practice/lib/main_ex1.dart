import 'package:flutter/material.dart';

// Ex1
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Text('My name is Nika', 
                    style: TextStyle(
                      color: Color.fromRGBO(255, 102, 0, 100),
                      fontSize: 50
                      ))
      )
    )
  
  ));
}