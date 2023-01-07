

import 'package:flutter/material.dart';
import 'package:private_feed/utils/all_colors.dart';
import 'package:private_feed/views/components/labels.dart';



class CustomSnackbar {
  final BuildContext context;
  final String title;


  CustomSnackbar({required this.context, required this.title});

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  show(){

    final snackBar = SnackBar(

        backgroundColor: AllColors.black,
        content: SizedBox(
            height: 30,
            width: double.maxFinite,
            child: Center(child: Label(text: title, color: AllColors.white, ))));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}