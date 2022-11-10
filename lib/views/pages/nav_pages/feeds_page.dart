import 'package:flutter/material.dart';

import '../../../utils/all_colors.dart';
import '../../components/appbar.dart';
import '../../components/feed_builder.dart';
import '../feed_item.dart';

class FeedsPage extends StatefulWidget {
  const FeedsPage({super.key});

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FeedItem()));
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: FeedBuilder(),
        ),
      ),
    );
  }
}
