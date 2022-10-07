// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:private_feed/utils/all_colors.dart';
import 'package:private_feed/views/components/feed_item_builder.dart';

import '../../utils/font_size.dart';
import '../components/labels.dart';

class FeedItem extends StatefulWidget {
  const FeedItem({super.key});

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                        ),
                      ),
                      Label(
                        align: TextAlign.center,
                        text: 'My Feeds',
                        fontSize: FontSize.h3,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Container(
                    height: 36,
                    width: 145,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Label(
                        text: 'NEED FEED',
                        fontWeight: FontWeight.w500,
                        color: AllColors.blue,
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          primary: AllColors.white,
                          onPrimary: AllColors.blue,
                          side: BorderSide(
                            color: AllColors.grey,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(66),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FeedItemBuilder(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
