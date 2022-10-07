// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:private_feed/views/components/labels.dart';

import '../../utils/font_size.dart';

class FeedMembersListSeparated extends StatelessWidget {
  const FeedMembersListSeparated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 2,
        );
      },
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.account_circle),
                SizedBox(
                  width: 10.5,
                ),
                Label(
                  text: 'James Baldwin',
                  fontSize: FontSize.p3,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.people),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
