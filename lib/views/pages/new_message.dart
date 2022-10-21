// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:private_feed/views/pages/feed_dashboard.dart';
import 'package:private_feed/views/pages/feed_item.dart';
import 'package:private_feed/views/pages/feed_members.dart';
import '../../utils/all_colors.dart';
import '../../utils/font_size.dart';

import '../components/appbar.dart';
import '../components/buttons.dart';
import '../components/labels.dart';
import '../components/select_image_viewer.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _PickProfileImageState();
}

class _PickProfileImageState extends State<NewMessage> {
  String _profilePlaceholder = "assets/images/select_picture.svg";

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
      appBar: CustomAppbar(
        elevation: 0.0,
        title: 'My awesome feed',
        backgroundColor: AllColors.appcolor,
        foregroundColor: AllColors.black,
        actionIcon: Icons.people,
        backLeadingIcon: Icons.arrow_back_ios,
        imageLeadingIcon: Icons.image,
        onPressedImage: () {},
        onPressedAccount: () {
          Navigator.push(
              context,
              PageTransition(
                  child: FeedItem(), type: PageTransitionType.leftToRight));
        },
        onPressedBack: () {
          Navigator.push(
              context,
              PageTransition(
                  child: FeedMembers(), type: PageTransitionType.leftToRight));
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Label(
                text: 'New Message',
                fontSize: FontSize.h3,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 30,
              ),
              SelectImageViewer(
                image: imageFile,
                height: 326,
                width: MediaQuery.of(context).size.width,
                center: Center(
                  child: SvgPicture.asset(
                    _profilePlaceholder,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    color: AllColors.darkGrey,
                  ),
                ),
                onSelectImage: () {
                  _pickImage(ImageSource.gallery);
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'type here to something',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FillButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FeedDashboard()));
                },
                text: 'Submit',
                containerColor: AllColors.blue,
                textColor: AllColors.white,
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
