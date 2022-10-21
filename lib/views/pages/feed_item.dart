// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:private_feed/utils/all_colors.dart';
import 'package:private_feed/views/components/feed_item_builder.dart';
import 'package:private_feed/views/pages/feed_dashboard.dart';
import 'package:private_feed/views/pages/nav_pages/new_feed.dart';

import '../../utils/font_size.dart';
import '../components/appbar.dart';
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
      appBar: CustomAppbar(
        elevation: 0.0,
        title: 'My awesome feed',
        backgroundColor: AllColors.appcolor,
        foregroundColor: AllColors.black,
        actionIcon: Icons.people,
        backLeadingIcon: Icons.arrow_back_ios,
        imageLeadingIcon: Icons.image,
        onPressedBack: () {
          Navigator.push(
              context,
              PageTransition(
                  child: FeedDashboard(),
                  type: PageTransitionType.leftToRight));
        },
        onPressedImage: () {},
        onPressedAccount: () {},
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
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
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NewFeed()));
                      },
                      icon: Icon(Icons.add),
                      label: Label(
                        text: 'NEW FEED',
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
