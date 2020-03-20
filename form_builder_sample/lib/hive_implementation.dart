import 'package:formbuilder/helpers/database.dart';
import 'package:formbuilder/helpers/data_storage.dart';
import 'package:formbuilder/redux/models/store_view_model.dart';
import 'package:hive/hive.dart';

class HiveImplementation implements Database {
  ///Function to save data
  static void saveData({StoreViewModel viewModel, dynamic answer}) {
    DataStorage.saveData(viewModel: viewModel, answer: answer);
    var dataKey = viewModel.currentNode.dataKey;
    var box = Hive.box('DataBox');
    box.put(dataKey, answer);
  }

  ///Function to upload image to fireBase
  static void uploadImage() {
  }

  String getData(String dataKey){
    var box = Hive.box('DataBox');
    String data = box.get(dataKey);
    DataStorage.updateData(dataKey, data);
    return data;
  }
}