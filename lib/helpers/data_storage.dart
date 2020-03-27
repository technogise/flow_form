import 'dart:io';

import 'package:formbuilder/formbuilder.dart';

import '../redux/actions/actions.dart';
import '../redux/models/store_view_model.dart';
import '../redux/store.dart';

///Class to do all database related operations
class DataStorage {
  ///Function to update data in fireStore
  static void storeData({
    Map<String, dynamic> toUpdate,
  }) {
    store.dispatch(CaptureUserResponse(toUpdate: toUpdate));
  }

  ///Function to save data
  static void saveData({StoreViewModel viewModel, dynamic answer}) {
    var dataKey = viewModel.currentNode.dataKey;
    DataStorage.storeData(
      toUpdate: {dataKey: answer},
    );
  }

  ///Function to upload image to fireBase
  static void uploadImage(QuestionNavigation questionNavigation, File image) {
    var key = questionNavigation.getDataKey();
    store.dispatch(CaptureUserResponse(toUpdate: {key: image}));
  }

  static void updateData(String dataKey, dynamic answer) {
    DataStorage.storeData(
      toUpdate: {dataKey: answer},
    );
  }
}
