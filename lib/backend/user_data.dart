import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:private_feed/backend/model/auth_user.dart';
import 'package:private_feed/views/components/custom_snackbar.dart';
import 'package:private_feed/views/pages/feed_dashboard.dart';

import 'package:uuid/uuid.dart';

class UserData {
  signUp(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // await UserData()
      //     .createUser(email: auth.user!.email.toString(), id: auth.user!.uid);

      // await auth.user!.sendEmailVerification();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => FeedDashboard()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        CustomSnackbar(title: "Email already exists", context: context).show();
      } else {
        CustomSnackbar(title: e.message.toString(), context: context).show();
      }
    }
  }

  signIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // await UserData()
      //     .createUser(email: auth.user!.email.toString(), id: auth.user!.uid);

      // await auth.user!.sendEmailVerification();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => FeedDashboard()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomSnackbar(title: "User not found!", context: context).show();
      } else if (e.code == 'wrong-password') {
        CustomSnackbar(title: "Wrong Password!", context: context).show();
      } else {
        CustomSnackbar(title: e.message.toString(), context: context).show();
      }
    }
  }

  Stream<AuthUser> getUser({required String id}) {
    Stream<DocumentSnapshot> userData =
        FirebaseFirestore.instance.collection('users').doc(id).snapshots();
    return userData
        .map((event) => AuthUser(data: event.data() as Map<String, dynamic>));
  }

  /// The user selects a file, and the task is added to the list.

}
