import 'package:flutter/material.dart';
import 'package:private_feed/views/pages/nav_pages/feeds_page.dart';
import 'package:private_feed/views/pages/feed_dashboard.dart';
import 'package:private_feed/views/pages/feed_item.dart';
import 'package:private_feed/views/pages/get_started.dart';
import 'package:private_feed/views/pages/splash_screen.dart';

void main() {
  runApp(const PrivateFeed());
}

class PrivateFeed extends StatelessWidget {
  const PrivateFeed({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}