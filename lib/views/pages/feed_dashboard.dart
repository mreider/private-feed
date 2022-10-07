// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:private_feed/utils/all_colors.dart';
import 'package:private_feed/views/components/appbar.dart';
import 'package:private_feed/views/components/bottom_navbar.dart';
import 'package:private_feed/views/pages/nav_pages/edit_profile.dart';
import 'package:private_feed/views/pages/nav_pages/feeds_page.dart';
import 'package:private_feed/views/pages/nav_pages/new_feed.dart';
import 'package:private_feed/views/pages/new_message.dart';

class FeedDashboard extends StatefulWidget {
  const FeedDashboard({super.key});

  @override
  State<FeedDashboard> createState() => _FeedDashboardState();
}

class _FeedDashboardState extends State<FeedDashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
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
        onPressedAccount: () {},
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          //upcoming
          FeedsPage(),
          NewFeed(),
          //upcoming
          EditProfile()
        ],
      ),
      // BottomNavigationBar
      bottomNavigationBar: CustomBottomNavbar(
        tabController: _tabController,
        height: 70,
        size: 30,
        color: AllColors.appcolor,
        unselectedLabelColor: AllColors.black,
        indicatorColor: AllColors.appcolor,
        labelColor: AllColors.blue,
      ),
    );
  }
}
