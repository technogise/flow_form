import 'package:flutter/material.dart';
import 'package:formbuilder/formbuilder.dart';
import 'package:formbuilder/helpers/data_storage.dart';

import '../components/comment.dart';
import '../components/file_uploader/uploader.dart';
import '../components/question.dart';

///Widget to upload files
class FileUploadScreen extends StatefulWidget {
  ///Static variable to represent the screen type
  static String type = 'file-upload';

  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  @override
  Widget build(BuildContext context) {
    var questionNavigation = FormBuilderProvider.navigatorOf(context);
    var selectScreenMeta = questionNavigation.getSelectScreenMeta();
    final String nextNode = selectScreenMeta.options.first;
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Comment(text: selectScreenMeta.comment),
        QuestionCard(text: selectScreenMeta.question),
        FileUploader(onSubmit: (file) {
          DataStorage.uploadImage(questionNavigation, file);
          questionNavigation.submitAnswer(nextNode);
        }),
      ],
    );
  }
}
