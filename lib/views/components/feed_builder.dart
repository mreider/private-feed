// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:private_feed/views/components/labels.dart';
import 'package:private_feed/views/components/select_image_viewer.dart';

import '../../utils/all_colors.dart';
import '../../utils/font_size.dart';
import 'feed_like_comment.dart';

class FeedBuilder extends StatefulWidget {
  const FeedBuilder({Key? key}) : super(key: key);

  @override
  State<FeedBuilder> createState() => _FeedBuilderState();
}

String _profilePlaceholder = "assets/images/select_picture.svg";

class _FeedBuilderState extends State<FeedBuilder> {
  int _feeditem = 2;
  File? imageFile;

  Future _futureImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        imageFile = File(image.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 19,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 2,
              );
            },
            itemCount: _feeditem,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  //Matt reider and edit section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10.5,
                          ),
                          Label(
                            text: 'Matt Reider',
                            fontSize: FontSize.p2,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Image Section
                  Container(
                    height: 326,
                    width: MediaQuery.of(context).size.width,
                    color: AllColors.grey,
                    child: imageFile == null
                        ? Center(
                            child: SvgPicture.asset(
                              _profilePlaceholder,
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              color: AllColors.darkGrey,
                            ),
                          )
                        : Center(
                            child: Image.file(
                              imageFile!,
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 7.5,
                  ),
                  //post text section
                  Label(
                      fontSize: FontSize.p2,
                      fontWeight: FontWeight.w400,
                      text:
                          'Here we are camping in the Sierra Nevadas. It was super fun.'),
                  SizedBox(
                    height: 10.5,
                  ),
                  //like section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: AllColors.danger,
                          ),
                          SizedBox(
                            width: 10.5,
                          ),
                          Label(
                            text: '${index + 4} Likes',
                            fontSize: FontSize.p2,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 15,
                            child: feedlikeWidget(
                              icon: Icons.account_circle_outlined,
                              color: AllColors.danger,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                            child: feedlikeWidget(
                              icon: Icons.account_circle_outlined,
                              color: AllColors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                            child: feedlikeWidget(
                              icon: Icons.account_circle_outlined,
                              color: AllColors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Label(
                            text: 'Sept 12, 5:34 PM',
                            fontSize: FontSize.p4,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //comments section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.comment,
                        color: AllColors.blue,
                      ),
                      SizedBox(
                        width: 10.5,
                      ),
                      Label(
                        text: ' Comments',
                        fontSize: FontSize.p2,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 15,
                        child: feedcommentWidget(
                          icon: Icons.account_circle_outlined,
                          color: AllColors.danger,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                        child: feedcommentWidget(
                          icon: Icons.account_circle_outlined,
                          color: AllColors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                        child: feedcommentWidget(
                          icon: Icons.account_circle_outlined,
                          color: AllColors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 26,
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
