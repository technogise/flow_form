import 'dart:io';

import '../question_navigation.dart';
import '../redux/actions/actions.dart';
import '../redux/store.dart';

///Class to do all database related operations
class DataStorage {
  ///Function to update data in fireStore
  static void storeData({
    Map<String, dynamic> toUpdate,
  }) {}

  ///Function to save data
  static void saveData({String dataKey, dynamic answer}) {
    DataStorage.storeData(
      toUpdate: {dataKey: answer},
    );
  }

  ///Function to upload image to fireBase
  static void uploadImage(QuestionNavigation questionNavigation, File image) {
    String key = questionNavigation.getCurrentDataKey();
  }

  static void updateData(String dataKey, dynamic answer) {
    DataStorage.storeData(
      toUpdate: {dataKey: answer},
    );
  }
}
