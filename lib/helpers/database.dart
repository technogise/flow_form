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
  static void uploadImageToFireBase(StoreViewModel viewModel, File image) {
//    var userEmail = viewModel.currentUser.email;
//    var key = viewModel.currentNode.dataKey;
//    var imagePath = path.basename(image.path);
//    var imagePathInFireBase = 'finday/$userEmail/$key/$imagePath';
//
//    var storageReference =
//        FirebaseStorage.instance.ref().child(imagePathInFireBase);
//
//    var uploadTask = storageReference.putFile(image);
//    uploadTask.onComplete.then(
//      (response) {
//        storageReference.getDownloadURL().then(
//          (fileURL) {
//            store.dispatch(CaptureUserResponse(toUpdate: {key: image}));
//          },
//        );
//      },
//    );
//  }
  }
}
