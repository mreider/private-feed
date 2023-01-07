import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:private_feed/views/components/custom_snackbar.dart';
import 'package:private_feed/views/pages/feed_dashboard.dart';

class UserAuth {
  signUp({required BuildContext context, required String email, required String password}) async {
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
       CustomSnackbar(title:e.message.toString(),context: context).show();
      }
    }
  }

  signIn({required BuildContext context, required String email, required String password}) async {
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
      } else if(e.code=='wrong-password') {
        CustomSnackbar(title:"Wrong Password!",context: context).show();
      }else{
        CustomSnackbar(title:e.message.toString(),context: context).show();
      }
    }
  }
}
