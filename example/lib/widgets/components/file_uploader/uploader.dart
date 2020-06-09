import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../buttons/rounded_button.dart';
import '../buttons/submit_button.dart';
import 'selection_preview.dart';

///Widget to upload files
class FileUploader extends StatefulWidget {
  ///Method to trigger when submitting the file uploads
  final Function onSubmit;

  ///Constructor to intantiate file uploader
  FileUploader({@required this.onSubmit});

  @override
  _FileUploaderState createState() => _FileUploaderState();
}

class _FileUploaderState extends State<FileUploader> {
  File file;
  String fileName;

  void _pickFile(String label) async {
    var selectedFile = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    setState(() {
      file = selectedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RoundedButton(
            label: "Upload",
            onPressed: _pickFile,
          ),
          Preview(file),
          SubmitButton(
            active: file != null,
            onPressed: (label) {
              widget.onSubmit(file);
            },
          )
        ],
      ),
    );
  }
}
