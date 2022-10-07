// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/all_colors.dart';
import '../../utils/font_size.dart';

import '../components/buttons.dart';
import '../components/labels.dart';
import '../components/select_image_viewer.dart';

class EditMessage extends StatefulWidget {
  const EditMessage({Key? key}) : super(key: key);

  @override
  State<EditMessage> createState() => _PickProfileImageState();
}

class _PickProfileImageState extends State<EditMessage> {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 116,
              ),
              Label(
                text: 'Edit Message',
                fontSize: FontSize.h3,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
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
                  Positioned(
                    top: 20,
                    right: 20,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: AllColors.danger,
                      ),
                    ),
                  )
                ],
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
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          await _pickImage(ImageSource.gallery);
                        },
                        child: SvgPicture.asset(
                          _profilePlaceholder,
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          color: AllColors.darkGrey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    flex: 10,
                    child: FillButton(
                      onPressed: () {},
                      text: 'Submit',
                      containerColor: AllColors.blue,
                      textColor: AllColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 200,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                        color: AllColors.danger,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Label(
                        text: 'Delete Message',
                        color: AllColors.danger,
                        fontSize: FontSize.p3,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
