import 'package:flutter/material.dart';

///Class for reusable Comment component
class Comment extends StatelessWidget {
  ///variable to store comment text
  final String text;

  ///Constructor
  Comment({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 60, 20, 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
