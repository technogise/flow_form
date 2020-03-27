import 'package:formbuilder/helpers/data_storage.dart';
import 'package:formbuilder/helpers/database.dart';
import 'package:hive/hive.dart';

class DatabaseImpl implements Database {
  ///Function to save data
  void saveData({String dataKey, dynamic answer}) {
    DataStorage.saveData(
      dataKey: dataKey,
      answer: answer,
    );
    var box = Hive.box('DataBox');
    box.put(dataKey, answer);
  }


  ///Function to upload image to fireBase
  void uploadImage() {}

  String getData(String dataKey) {
    var box = Hive.box('DataBox');
    String data = box.get(dataKey);
    DataStorage.updateData(dataKey, data);
    return data;
  }
}
