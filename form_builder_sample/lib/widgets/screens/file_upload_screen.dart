import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/helpers/data_storage.dart';
import 'package:formbuilder/redux/app_state.dart';
import 'package:formbuilder/redux/models/store_view_model.dart';

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
    return StoreConnector<AppState, StoreViewModel>(
      converter: StoreViewModel.fromStore,
      builder: (context, viewModel) {
        var selectScreenMeta = viewModel.getSelectScreenMeta();
        final String nextNode = selectScreenMeta.options.first;
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Comment(text: selectScreenMeta.comment),
            QuestionCard(text: selectScreenMeta.question),
            FileUploader(onSubmit: (file) {
              DataStorage.uploadImage(viewModel, file);
              viewModel.moveToNextNode(nextNode);
            }),
          ],
        );
      },
    );
  }
}
