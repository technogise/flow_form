import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import '../buttons/rounded_button.dart';

///File Picker Preview
class Preview extends StatelessWidget {
  ///Instance variable that contains the file to be previewed
  final File file;

  ///Constructor to initialise file
  Preview(this.file);

  void _openFile(String label) async {
    await OpenFile.open(file.path);
  }

  String _fileName() {
    return file.path.split('/').last;
  }

  @override
  Widget build(BuildContext context) {
    if (file == null) return SizedBox();
    return RoundedButton(
      onPressed: _openFile,
      label: _fileName(),
    );
  }
}
