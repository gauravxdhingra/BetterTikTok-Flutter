// import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageProvider with ChangeNotifier {
  final StorageReference storageRef = FirebaseStorage.instance.ref();
  // File file;

  Future<String> uploadImage(file) async {
    StorageUploadTask uploadTask = storageRef.child('post_1.mp4').putFile(file);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  handleSubmit() async {
    // setState(() {
    //   isUploading = true;
    // });
    // await compressImage();
    // String mediaUrl = await uploadImage(file);
    // createPostInFirestore(
    //   mediaUrl: mediaUrl,
    //   location: locationController.text,
    //   desc: captionController.text,
    // );
    // captionController.clear();
    // locationController.clear();
    // setState(() {
    //   file = null;
    //   isUploading = false;
    //   postId = Uuid().v4();
    // });
  }

  createVideoEntryInFirebase() {}
  uploadVideoToFirestoreCloud() {}
}
