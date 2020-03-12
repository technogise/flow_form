import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/helpers/database.dart';
import 'package:formbuilder/redux/app_state.dart';
import 'package:formbuilder/redux/models/store_view_model.dart';

import '../components/comment.dart';
import '../components/file_uploader/uploader.dart';
import '../components/question.dart';

///Widget to upload files
class FileUploadScreen extends StatefulWidget {
  ///Static variable to represent the screen type
  static String type = 'file-upload';

  ///Instance variable to store the view model
  final StoreViewModel viewModel;

  ///Constructor to instantiate File Uploader
  FileUploadScreen(this.viewModel);

  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StoreViewModel>(
      converter: StoreViewModel.fromStore,
      builder: (context, viewModel) {
        final String nextNode = viewModel.getScreenData("options").first;
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Comment(text: viewModel.getScreenData("label")),
            QuestionCard(text: viewModel.getScreenData("question")),
            FileUploader(onSubmit: (file) {
              Database.uploadImageToFireBase(viewModel, file);
              viewModel.moveToNextNode(nextNode);
            }),
          ],
        );
      },
    );
  }
}
