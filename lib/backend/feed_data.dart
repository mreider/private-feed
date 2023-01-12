import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:private_feed/backend/model/feed.dart';
import 'package:private_feed/views/components/custom_snackbar.dart';
import 'package:uuid/uuid.dart';
import 'dart:io' as io;

class FeedData {
  var user = FirebaseAuth.instance.currentUser;
  Stream<List<Feed>> getAllFeeds() {
    Stream<QuerySnapshot> stream =
        FirebaseFirestore.instance.collection("feeds").snapshots();

    return stream.map((event) => event.docs
        .map((e) => Feed(data: e.data() as Map<String, dynamic>))
        .toList());
  }

  Future<String?> uploadFile(
      {XFile? file,
      required BuildContext context,
      required String postID}) async {
    if (file == null) {
      CustomSnackbar(context: context, title: "No file selected!").show();

      return null;
    }


    String imageId = Uuid().v4();

    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('post_images')
        .child('/$imageId.jpg');


    var url;
    try {
      await ref.putFile(io.File(file.path));
   url =await ref.getDownloadURL();

    } on FirebaseException catch (e) {
      print(e.message);
    }





    return url;
  }

  addFeed({required Feed feed, required BuildContext context}) {
    FirebaseFirestore.instance.collection("feeds").doc(feed.id).set({
      "id": feed.id,
      "author": user!.uid,
      "createdAt": feed.createdAt,
      "updatedAt": feed.updatedAt,
      "description": feed.description,
      "imageUrl": feed.imageUrl,
      "likes": [],
      "comments": []
    });
  }
}
