import 'dart:io';
import 'package:path/path.dart' as path;
import '../redux/actions/actions.dart';
import '../redux/models/store_view_model.dart';
import '../redux/store.dart';

///Class to do all database related operations
class Database {

  ///Function to update data in fireStore
  static void saveDataToFireStore({
    Map<String, dynamic> toUpdate,
  }) {
    store.dispatch(CaptureUserResponse(toUpdate: toUpdate));
  }

  ///Function to save data
  static void saveData({StoreViewModel viewModel, dynamic answer}) {
    var dataKey = viewModel.currentNode.dataKey;
    Database.saveDataToFireStore(
      toUpdate: {dataKey: answer},
    );
  }

  ///Function to upload image to fireBase
  static void uploadImage(StoreViewModel viewModel, File image) {
    var key = viewModel.currentNode.dataKey;
    store.dispatch(CaptureUserResponse(toUpdate: {key: image}));
  }

}
