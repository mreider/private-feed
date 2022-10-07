// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:private_feed/views/components/image_viewer.dart';
import 'package:private_feed/views/components/labels.dart';
import 'package:private_feed/views/pages/feed_dashboard.dart';

import '../../utils/font_size.dart';

class PickProfileImage extends StatefulWidget {
  const PickProfileImage({Key? key}) : super(key: key);

  @override
  State<PickProfileImage> createState() => _PickProfileImageState();
}

class _PickProfileImageState extends State<PickProfileImage> {
  File? imageFile;

  Future _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    setState(() {
      if (image != null) {
        imageFile = File(image.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 60,
            ),
            Label(
              text: 'Select a profile photo',
              fontSize: FontSize.h1,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 60,
            ),
            ImageViewer(
              image: imageFile,
              onSelecImage: () async {
                await _pickImage(ImageSource.gallery);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => FeedDashboard()));
        },
      ),
    );
  }
}
