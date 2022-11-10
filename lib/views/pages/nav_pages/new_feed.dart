// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:private_feed/views/components/textfields.dart';
import 'package:private_feed/views/pages/feed_item.dart';
import 'package:private_feed/views/pages/feed_members.dart';
import '../../../utils/all_colors.dart';
import '../../../utils/font_size.dart';

import '../../components/appbar.dart';
import '../../components/buttons.dart';
import '../../components/labels.dart';
import '../../components/select_image_viewer.dart';
import '../feed_dashboard.dart';

class NewFeed extends StatefulWidget {
  const NewFeed({Key? key}) : super(key: key);

  @override
  State<NewFeed> createState() => _PickProfileImageState();
}

class _PickProfileImageState extends State<NewFeed> {
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
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          elevation: 0.0,
          title: 'My awesome feed',
          backgroundColor: AllColors.appcolor,
          foregroundColor: AllColors.black,
          actionIcon: Icons.people,
          imageLeadingIcon: Icons.image,
          backLeadingIcon: Icons.arrow_back_ios,
          onPressedImage: () {},
          onPressedAccount: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FeedItem()));
          },
          onPressedBack: () {
            Navigator.push(
                context,
                PageTransition(
                    child: FeedDashboard(),
                    type: PageTransitionType.leftToRight));
          },
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Label(
                    align: TextAlign.center,
                    text: 'New Feed',
                    fontSize: FontSize.h3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Label(
                    fontSize: FontSize.p4,
                    color: AllColors.darkGrey.withOpacity(0.7),
                    text: 'Feed Name',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  hintText: 'My awesome feed',
                  validator: (value) {},
                  border: OutlineInputBorder(),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Label(
                    fontSize: FontSize.p4,
                    color: AllColors.darkGrey.withOpacity(0.7),
                    text: 'Feed Photo',
                  ),
                ),
                SizedBox(
                  height: 8,
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
                  height: 25,
                ),
                FillButton(
                  text: 'Chose Photo',
                  textColor: AllColors.blue,
                  onPressed: () async {
                    await _pickImage(ImageSource.gallery);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                FillButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FeedMembers()));
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
      ),
    );
  }
}
