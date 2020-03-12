import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import '../redux/actions/actions.dart';
import '../redux/models/store_view_model.dart';
import '../redux/store.dart';

///Class to do all database related operations
class Database {
  ///Prefix for database and storage
  static const String databasePrefix = 'finday';

  ///Function to update data in fireStore
  static Future saveDataToFireStore({
    String userEmail,
    Map<String, dynamic> toUpdate,
  }) {
    final fireStore = Firestore.instance;

    store.dispatch(CaptureUserResponse(toUpdate: toUpdate));
    return fireStore
        .collection(Database.databasePrefix)
        .document(userEmail)
        .setData(toUpdate, merge: true);
  }

  ///Get User Response
  static void getUserResponse(String userEmail) async {
    final fireBase = Firestore.instance;
    await fireBase
        .collection(Database.databasePrefix)
        .document(userEmail)
        .get()
        .then(
          (response) =>
              store.dispatch(CaptureUserResponse(toUpdate: response.data)),
        );
  }

  ///Function to save data
  static void saveData({StoreViewModel viewModel, dynamic answer}) {
    var dataKey = viewModel.currentNode.dataKey;
    Database.saveDataToFireStore(
      userEmail: viewModel.currentUser.email,
      toUpdate: {dataKey: answer},
    );
  }

  ///Function to upload image to fireBase
  static void uploadImageToFireBase(StoreViewModel viewModel, File image) {
    var userEmail = viewModel.currentUser.email;
    var key = viewModel.currentNode.dataKey;
    var imagePath = path.basename(image.path);
    var imagePathInFireBase = 'finday/$userEmail/$key/$imagePath';

    var storageReference =
        FirebaseStorage.instance.ref().child(imagePathInFireBase);

    var uploadTask = storageReference.putFile(image);
    uploadTask.onComplete.then(
      (response) {
        storageReference.getDownloadURL().then(
          (fileURL) {
            store.dispatch(CaptureUserResponse(toUpdate: {key: image}));
          },
        );
      },
    );
  }
}
