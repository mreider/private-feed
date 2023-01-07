// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:private_feed/views/components/custom_snackbar.dart';
import 'package:private_feed/views/components/textfields.dart';
import 'package:private_feed/views/components/edit_profile_dropdown.dart';
import 'package:private_feed/views/pages/get_started.dart';
import '../../../utils/all_colors.dart';
import '../../../utils/font_size.dart';

import '../../components/appbar.dart';
import '../../components/buttons.dart';
import '../../components/labels.dart';
import '../../components/select_image_viewer.dart';
import '../feed_item.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _PickProfileImageState();
}

class _PickProfileImageState extends State<EditProfile> {
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
          backLeadingIcon: Icons.arrow_back_ios,
          imageLeadingIcon: Icons.image,
          onPressedImage: () {},
          onPressedAccount: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FeedItem()));
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
                    text: 'Edit Profile',
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
                    text: 'Name',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  hintText: 'John Apple',
                  validator: (value) {},
                  border: OutlineInputBorder(),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Label(
                    fontSize: FontSize.p4,
                    color: AllColors.darkGrey.withOpacity(0.7),
                    text: 'Email',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                    ),
                  ),
                  hintText: 'member1@domain.com',
                  border: OutlineInputBorder(),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Label(
                    fontSize: FontSize.p4,
                    color: AllColors.darkGrey.withOpacity(0.7),
                    text: 'Profile Photo',
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
                  fontSize: FontSize.p3,
                  text: 'choose a new photo',
                  textColor: AllColors.blue,
                  onPressed: () async {
                    await _pickImage(ImageSource.gallery);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                FillButton(
                  onPressed: () {},
                  text: 'Save',
                  fontSize: FontSize.p3,
                  containerColor: AllColors.blue,
                  textColor: AllColors.white,
                ),
                SizedBox(
                  height: 50,
                ),
                EditProfileDropdown(),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Label(
                    text: "Danger Zone",
                    fontSize: FontSize.h3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 25,),
                FillButton(text: 'Logout', onPressed: () async {
                await  FirebaseAuth.instance.signOut();
                CustomSnackbar(title: "Logged out successfully", context: context);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>GetStarted()), (route) => false);
                },),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Label(
                      text: 'Delete Feed',
                      color: AllColors.danger,
                      underline: TextDecoration.underline,
                      fontSize: FontSize.p3,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Label(
                      align: TextAlign.center,
                      text: 'This is permanent. Can not be undone.'),
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
