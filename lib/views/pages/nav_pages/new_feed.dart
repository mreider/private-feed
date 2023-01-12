// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:private_feed/backend/feed_data.dart';
import 'package:private_feed/backend/model/feed.dart';
import 'package:private_feed/backend/user_data.dart';
import 'package:private_feed/views/components/textfields.dart';
import 'package:private_feed/views/pages/feed_item.dart';
import 'package:private_feed/views/pages/feed_members.dart';
import 'package:uuid/uuid.dart';
import '../../../utils/all_colors.dart';
import '../../../utils/font_size.dart';

import '../../components/appbar.dart';
import '../../components/buttons.dart';
import '../../components/labels.dart';
import '../../components/select_image_viewer.dart';

class NewFeed extends StatefulWidget {
  const NewFeed({Key? key}) : super(key: key);

  @override
  State<NewFeed> createState() => _PickProfileImageState();
}

class _PickProfileImageState extends State<NewFeed> {
  String _profilePlaceholder = "assets/images/select_picture.svg";

  File? _imageFile;

  Future _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    setState(() {
      if (image != null) {
        _imageFile = File(image.path);
      }
    });
  }

  String _description ="";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          automaticallyImplyLeading: false,
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
                Label(
                  fontSize: FontSize.p4,
                  color: AllColors.darkGrey.withOpacity(0.7),
                  text: 'Feed Name',
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  onChanged: (v){
_description=v;
                  },
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
                  image: _imageFile,
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
                  onPressed: () async {
                    String postID = Uuid().v4();

                    String? imageUrl = await FeedData().uploadFile(
                        context: context,
                        postID: postID,
                        file: XFile(_imageFile!.path));



                    print(imageUrl);
                  await   FeedData().addFeed(feed: Feed(data: {
                    "id": postID,
                    "description": _description,
                    "createdAt": DateTime.now(),
                    "updatedAt": DateTime.now(),
                    "imageUrl":imageUrl,
                     "likes": [],
                    "comments":[]


                  }),context: context);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => FeedMembers()));
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
