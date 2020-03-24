import 'package:flutter/material.dart';

///Class for reusable Question card
class QuestionCard extends StatelessWidget {
  ///variable to store question text label
  final String text;

  ///Constructor
  QuestionCard({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      constraints: BoxConstraints(minHeight: 50),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
