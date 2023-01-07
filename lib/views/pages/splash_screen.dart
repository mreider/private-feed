import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:private_feed/views/components/labels.dart';
import 'package:private_feed/views/pages/feed_dashboard.dart';
import 'package:private_feed/views/pages/get_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _gotoGetStartedPage();
    // Add code after super
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Label(text: 'Private Feed'),
      ),
    );
  }

  Future<void> _gotoGetStartedPage() async {
    await Future.delayed(Duration(seconds: 1));
    var user=FirebaseAuth.instance.currentUser;
    if(user==null){
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => GetStarted()), (route) => false);
    }else{
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => FeedDashboard()), (route) => false);
    }


  }
}
