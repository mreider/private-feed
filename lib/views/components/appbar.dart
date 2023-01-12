// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final IconData? actionIcon, backLeadingIcon, imageLeadingIcon;
  final VoidCallback? onPressedBack, onPressedImage, onPressedAccount;
  final bool? automaticallyImplyLeading;

  const CustomAppbar({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.actionIcon,
    this.backLeadingIcon,
    this.imageLeadingIcon,
    this.onPressedBack,
    this.onPressedImage,
    this.onPressedAccount,  this.automaticallyImplyLeading,
  }) : super(key: key);

  @override
  final double _fromHeight = 60;
  Size get preferredSize => Size.fromHeight(_fromHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading??true,
      foregroundColor: foregroundColor,
      elevation: elevation,
      //when used ledadingWidth > backLeading Icon not working
      // leadingWidth: 0,
      leading: onPressedBack != null
          ? IconButton(
            onPressed: onPressedBack,
            icon: Icon(backLeadingIcon),
          )
          : SizedBox(),
      title: Row(
        children: [
          Expanded(
            flex: 2,
            child: IconButton(
              onPressed: onPressedImage,
              icon: Icon(imageLeadingIcon),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(flex: 10, child: Text(title!)),
        ],
      ),
      backgroundColor: backgroundColor,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 18),
          child: IconButton(
            onPressed: onPressedAccount,
            icon: Icon(actionIcon),
          ),
        ),
      ],
    );
  }
}
