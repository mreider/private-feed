// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  final TabController _tabController;
  final Color? color, unselectedLabelColor, indicatorColor, labelColor;
  final double? height;
  final double? size;

  const CustomBottomNavbar({
    Key? key,
    this.color,
    this.unselectedLabelColor,
    this.indicatorColor,
    this.labelColor,
    this.height,
    this.size,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: height,
        color: color,
        child: TabBar(
          unselectedLabelColor: unselectedLabelColor,
          indicatorColor: indicatorColor,
          labelColor: labelColor,
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                size: size,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.add_circle,
                size: size,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.account_circle,
                size: size,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
