import 'package:flutter/material.dart';

import '../../styles/common.dart';

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
        style: AppText.commentText,
      ),
    );
  }
}
